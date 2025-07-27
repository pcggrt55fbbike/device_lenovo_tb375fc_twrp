# BoardConfig.mk for TB375FC with TB373FU ZUI ROM

# ----------------------------------------
# Device path
DEVICE_PATH := device/lenovo/tb375fc

# ----------------------------------------
# Architecture definitions
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := arm64-v8a

# ----------------------------------------
# Platform and bootloader
TARGET_BOARD_PLATFORM := mt6789
TARGET_BOOTLOADER_BOARD_NAME := tb375fc
TARGET_NO_BOOTLOADER := true

# ----------------------------------------
# DTB-only boot (kernel externally built)
BOARD_INCLUDE_DTB_IN_BOOTIMG := false
BOARD_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb

# ----------------------------------------
# Vendor_boot configuration
BOARD_BUILD_VENDOR_BOOT_IMAGE := true
BOARD_VENDOR_RAMDISK_RECOVERY := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864

# (Optional but recommended)
BOARD_RAMDISK_USE_XZ := true
BOARD_KERNEL_IMAGE_NAME := Image.gz

# ----------------------------------------
# Partitions
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_TYPE := f2fs

# ----------------------------------------
# Recovery encryption support
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
