# twrp_tb375fc.mk for TB375FC using TB373FU ROM
PRODUCT_NAME := twrp_tb375fc
DEVICE_PATH := device/lenovo/tb375fc

# Assert bypass — accept both device names
PRODUCT_OTA_ASSERT_DEVICE := tb373fu,tb375fc

# TWRP Features
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_MODEL_HARDWARE_ID := true

# Recovery settings
RECOVERY_VARIANT := twrp
TW_TARGET_USES_QCOM_BSP := false
TW_DEVICE_VERSION := TB375FC-on-ZUI-16.0

# Partition definitions
BOARD_VENDOR_BOOTIMAGE_PARTITION := vendor_boot
BOARD_RECOVERYIMAGE_PARTITION := vendor_boot

# Screen and UI
RECOVERY_SDCARD_ON_DATA := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_FB2PNG := true
TW_INPUT_BLACKLIST := "hbtp_vm"

# Include DTB and kernel
BOARD_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel/Image.gz
BOARD_PREBUILT_DTB := $(DEVICE_PATH)/dtb.img
