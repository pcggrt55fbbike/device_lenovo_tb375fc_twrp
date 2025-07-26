# device/lenovo/tb375fc/BoardConfig.mk

LOCAL_PATH := $(call my-dir)

# カーネル起動パラメータ
BOARD_KERNEL_CMDLINE := \
    androidboot.hardware=tb375fc \
    console=ttyMSM0,115200n8

# DTBO（Device Tree Blob Overlay）
BOARD_DTBOIMAGE_PARTITION := dtbo
BOARD_DTBOIMAGE_FILE      := dtbo.img

# リカバリ用パーティション
BOARD_RECOVERYIMAGE_PARTITION := recovery

# vendor_boot 用設定
BOARD_VENDORBOOTIMAGE_PARTITION := vendor_boot
BOARD_VENDORBOOTIMAGE_FILE      := vendor_boot.img

# AVB を無効化
BOARD_AVB_ENABLE := false

# SELinuxポリシーは vendor 側を使う
RECOVERY_VENDOR_SEPOLICY := true
