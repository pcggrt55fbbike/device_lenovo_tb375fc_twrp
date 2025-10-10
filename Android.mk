#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),tb373fu)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/etc/vintf/manifest.xml:system/etc/vintf/manifest.xml
endif
