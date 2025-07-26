# device/lenovo/tb375fc/AndroidProducts.mk

LOCAL_PATH := $(call my-dir)

# このデバイス向けの Makefile を列挙
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/device.mk \
    $(LOCAL_DIR)/BoardConfig.mk \
    $(LOCAL_DIR)/ProjectConfig.mk

# デバイス／ROM の識別子
PRODUCT_DEVICE := tb375fc
PRODUCT_BRAND  := lenovo
PRODUCT_MODEL  := TB-375FC
PRODUCT_MANUFACTURER := lenovo

# TWRP のベース定義を取り込む
inherit_vendor_bootimage := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/twrp_base.mk)
