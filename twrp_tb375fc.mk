# device/lenovo/tb375fc/twrp_tb375fc.mk

# 基本情報
PRODUCT_NAME := twrp_tb375fc
PRODUCT_DEVICE := tb375fc
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := Lenovo TB-375FC
PRODUCT_MANUFACTURER := Lenovo

# TWRP共通設定を継承
$(call inherit-product, vendor/twrp/config/common.mk)

# 必要なパッケージ（例）
PRODUCT_PACKAGES += \
    libfstools \
    recovery \
    libtwrp_gui \
    libtwcommon

# fstab を recovery 用にコピー
PRODUCT_COPY_FILES += \
    device/lenovo/tb375fc/recovery/root/system/etc/recovery.fstab:etc/recovery.fstab

# リカバリの起動イメージを上書き
PRODUCT_COPY_FILES += \
    device/lenovo/tb375fc/boot.img:boot.img
