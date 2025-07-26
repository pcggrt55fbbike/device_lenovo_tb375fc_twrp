# device/lenovo/tb375fc/AndroidProducts.mk

# この1行でTWRP用のProduct定義を読み込みます
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_tb375fc.mk
COMMON_LUNCH_CHOICES := \
    twrp_tb375fc-eng \
    twrp_tb375fc-userdebug
