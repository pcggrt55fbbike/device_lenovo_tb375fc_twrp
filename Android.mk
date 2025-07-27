#
# Copyright (C) 2024 The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),tb375fc)
    include $(call all-subdir-makefiles,$(LOCAL_PATH))

    # Add lunch combos for TWRP build targets
    add_lunch_combo twrp_tb375fc-eng
    add_lunch_combo twrp_tb375fc-userdebug
endif
