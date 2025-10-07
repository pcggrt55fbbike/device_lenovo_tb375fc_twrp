LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := mtk_fbe_decrypt
LOCAL_SRC_FILES := decrypt.cpp
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := libcrypto
include $(BUILD_EXECUTABLE)
