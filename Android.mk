LOCAL_PATH := $(call my-dir)

# Unconditionally enable lunch combos
add_lunch_combo twrp_tb375fc-eng
add_lunch_combo twrp_tb375fc-userdebug

# Subdir inclusion (optional)
ifeq ($(TARGET_DEVICE),tb375fc)
    include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
