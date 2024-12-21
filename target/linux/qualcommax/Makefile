include $(TOPDIR)/rules.mk

ARCH:=aarch64
BOARD:=qualcommax
BOARDNAME:=Qualcomm Atheros 802.11ax WiSoC-s
FEATURES:=squashfs ramdisk fpu nand rtc emmc
KERNELNAME:=Image
CPU_TYPE:=cortex-a53
SUBTARGETS:=ipq807x ipq60xx

KERNEL_PATCHVER:=6.12

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += \
	autocore cpufreq e2fsprogs f2fsck mkf2fs losetup luci uboot-envtools wpad-openssl \
	kmod-fs-ext4 kmod-fs-f2fs kmod-gpio-button-hotplug kmod-leds-gpio kmod-usb3 kmod-usb-dwc3 kmod-usb-dwc3-qcom \
	kmod-ath11k kmod-ath11k-ahb kmod-ath11k-pci kmod-phy-aquantia kmod-phy-qca83xx kmod-dsa kmod-dsa-qca8k kmod-dsa-tag-dsa \
	kmod-qca-nss-dp \
	kmod-qca-nss-drv \
	kmod-qca-nss-drv-bridge-mgr \
	kmod-qca-nss-drv-lag-mgr \
	kmod-qca-nss-drv-pppoe \
	kmod-qca-nss-drv-pptp \
	kmod-qca-nss-drv-vlan-mgr \
	kmod-qca-nss-ecm \
	kmod-qca-nss-mcs

$(eval $(call BuildTarget))
