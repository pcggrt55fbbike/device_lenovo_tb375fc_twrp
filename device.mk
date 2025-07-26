# device/lenovo/tb375fc/device.mk

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# ROM／デバイス識別
PRODUCT_DEVICE := tb375fc
PRODUCT_MODEL  := TB-375FC
PRODUCT_BRAND  := lenovo
PRODUCT_MANUFACTURER := lenovo

# カーネル／DTB の配置ディレクトリ
PRODUCT_BOOTIMAGE_KERNEL := kernel
PRODUCT_BOOTIMAGE_DTB    := dtb/$(TARGET_DEVICE).dtb

# TWRP リカバリを有効化
RECOVERY_VARIANTS := twrp

# リカバリの fstab をコピー
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/recovery.fstab:recovery.fstab

# vendor_boot をビルド
inherit_vendor_bootimage := true

# TWRP ベース定義
$(call inherit-product, $(SRC_TARGET_DIR)/product/twrp_base.mk)
