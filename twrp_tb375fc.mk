# SPDX-License-Identifier: Apache-2.0

# Inherit AOSP base & TWRP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from device-specific configuration
$(call inherit-product, device/lenovo/tb375fc/device.mk)

# Virtual A/B and storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Device identity
PRODUCT_DEVICE := tb375fc
PRODUCT_NAME := twrp_tb375fc
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := TB375FC
PRODUCT_MANUFACTURER := Lenovo

# Recovery variant and UI
RECOVERY_VARIANT := twrp
TW_DEVICE_VERSION := TB375FC-on-ZUI-16.0
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_USE_MODEL_HARDWARE_ID := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_FB2PNG := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
RECOVERY_SDCARD_ON_DATA := true
TW_TARGET_USES_QCOM_BSP := false

# Partition definitions
BOARD_VENDOR_BOOTIMAGE_PARTITION := vendor_boot
BOARD_RECOVERYIMAGE_PARTITION := vendor_boot

# Vendor_boot build declaration
PRODUCT_BUILD_VENDOR_BOOT_IMAGE := true
PRODUCT_VENDOR_RAMDISK_RECOVERY := true
PRODUCT_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864

# Prebuilt DTB (if needed)
DEVICE_PATH := device/lenovo/tb375fc
BOARD_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb

# OTA assertions (dual identity support)
PRODUCT_OTA_ASSERT_DEVICE := tb373fu,tb375fc

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.vendor_boot=true \
    persist.sys.fuse.passthrough.enable=true
