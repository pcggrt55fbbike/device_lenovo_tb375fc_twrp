#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from AOSP base configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit common Omni/TWRP configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from tb375fc device tree
$(call inherit-product, device/lenovo/tb375fc/device.mk)

# Configure launch_with_vendor_ramdisk.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Product Identity
PRODUCT_DEVICE := tb375fc
PRODUCT_NAME := twrp_tb375fc
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := TB375FC
PRODUCT_MANUFACTURER := Lenovo

# Assert bypass — accept both device names
PRODUCT_OTA_ASSERT_DEVICE := tb373fu,tb375fc

# TWRP UI & Features
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_MODEL_HARDWARE_ID := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_FB2PNG := true
TW_INPUT_BLACKLIST := "hbtp_vm"

# Recovery behavior
RECOVERY_VARIANT := twrp
TW_TARGET_USES_QCOM_BSP := false
TW_DEVICE_VERSION := TB375FC-on-ZUI-16.0
RECOVERY_SDCARD_ON_DATA := true

# Partition definitions
BOARD_VENDOR_BOOTIMAGE_PARTITION := vendor_boot
BOARD_RECOVERYIMAGE_PARTITION := vendor_boot

# Prebuilt kernel and DTB
DEVICE_PATH := device/lenovo/tb375fc
BOARD_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel/Image.gz
BOARD_PREBUILT_DTB := $(DEVICE_PATH)/dtb.img

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.vendor_boot=true \
    persist.sys.fuse.passthrough.enable=true
