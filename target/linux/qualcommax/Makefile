include $(TOPDIR)/rules.mk

ARCH:=aarch64
BOARD:=qualcommax
BOARDNAME:=Qualcomm Atheros 802.11ax WiSoC-s
FEATURES:=squashfs ramdisk fpu nand rtc emmc
KERNELNAME:=Image
CPU_TYPE:=cortex-a53
SUBTARGETS:=ipq807x ipq60xx

KERNEL_PATCHVER:=6.6

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += \
	autocore cpufreq e2fsprogs f2fsck mkf2fs losetup luci uboot-envtools wpad-openssl \
	kmod-fs-ext4 kmod-fs-f2fs kmod-gpio-button-hotplug kmod-leds-gpio kmod-usb3 kmod-usb-dwc3 kmod-usb-dwc3-qcom \
	kmod-ath11k kmod-ath11k-ahb kmod-ath11k-pci ath11k-firmware-qcn9074 kmod-phy-aquantia \
	kmod-qca-nss-crypto \
	kmod-qca-nss-dp \
	kmod-ath11k-ahb wpad-openssl \
	uboot-envtools losetup \
	automount autocore luci-app-cpufreq

$(eval $(call BuildTarget))
