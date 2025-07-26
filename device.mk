# device.mk for TB375FC with TB373FU ZUI ROM

DEVICE_PATH := device/lenovo/tb375fc
PRODUCT_DEVICE := tb375fc

# SoC Platform
TARGET_BOARD_PLATFORM := mt6789

# System properties for ROM compatibility
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=tb373fu \
    ro.build.product=tb373fu \
    ro.product.model=Lenovo TB375FC \
    ro.product.name=ZUI_16_TB373FU \
    ro.build.fingerprint=lenovo/ZUI_16_TB373FU/ZUI:13/SP1A.210812.003/230124:user/release-keys

# Custom properties to avoid build errors
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    persist.vendor.radio.multisim.config=dsds \
    persist.sys.locale=ja-JP

# Only include DTB (no kernel)
BOARD_PREBUILT_DTB := $(DEVICE_PATH)/dtb.img

# Recovery configuration (vendor_boot integration)
BOARD_VENDOR_RAMDISK_RECOVERY := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true

# TWRP Features
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_USB_STORAGE := false
TW_INPUT_BLACKLIST := "hbtp_vm"

# File system types
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_TYPE := f2fs
