#!/bin/sh

# 获取无线设备的数量
RADIO_NUM=$(uci show wireless | grep -c "wifi-device")

# 如果没有找到无线设备，直接退出
if [ "$RADIO_NUM" -eq 0 ]; then
	exit 0
fi

# 获取默认的SSID，如果没有设置则使用"OWRT"
BASE_SSID=$(uci get wireless.default_radio0.ssid 2>/dev/null)
BASE_SSID=${BASE_SSID:-"OWRT"}
FIRST_5G=""

# 配置无线设备
configure_wifi() {
	local radio=$1
	local channel=$2
	local ssid=$3
	local key=$4
	local now_encryption=$(uci get wireless.default_radio${radio}.encryption)

	# 如果当前加密方式已设置且不为"none"，则不更新配置
	if [ -n "$now_encryption" ] && [ "$now_encryption" != "none" ]; then
		echo "no update $channel $ssid $key"
		return 0
	fi

	# 设置无线设备参数
	uci set wireless.radio${radio}.channel="${channel}"
	uci set wireless.radio${radio}.country='CN'
	uci set wireless.radio${radio}.disabled='0'
	uci set wireless.radio${radio}.cell_density='0'
	uci set wireless.radio${radio}.mu_beamformer='1'

	uci set wireless.default_radio${radio}.ssid="${ssid}"
	uci set wireless.default_radio${radio}.encryption='psk2+ccmp'
	uci set wireless.default_radio${radio}.key="${key}"
	uci set wireless.default_radio${radio}.ieee80211k='1'
	uci set wireless.default_radio${radio}.time_advertisement='2'
	uci set wireless.default_radio${radio}.time_zone='CST-8'
	uci set wireless.default_radio${radio}.bss_transition='1'
	uci set wireless.default_radio${radio}.wnm_sleep_mode='1'
	uci set wireless.default_radio${radio}.wnm_sleep_mode_no_keys='1'
}

# 设置无线设备的默认配置
set_wifi_def_cfg() {
	local band=$(uci get wireless.radio$1.band 2>/dev/null)

	# 根据频段设置不同的SSID和信道
	if [[ $band == "5g" ]]; then
		if [ -z "$FIRST_5G" ]; then
			if [ $RADIO_NUM -eq 2 ]; then
				configure_wifi $1 '149' "${BASE_SSID}-5G" '12345678'
			else
				configure_wifi $1 '149' "${BASE_SSID}-5G_1" '12345678'
			fi
			FIRST_5G="1"
		else
			configure_wifi $1 '44' "${BASE_SSID}-5G_2" '12345678'
		fi
	else
		configure_wifi $1 '1' "${BASE_SSID}" '12345678'
	fi
}

# 遍历所有无线设备并设置默认配置
i=0
while [ $i -lt "$RADIO_NUM" ]; do
	set_wifi_def_cfg $i
	i=$((i + 1))
done

# 提交配置并重启网络服务
uci commit wireless

exit 0