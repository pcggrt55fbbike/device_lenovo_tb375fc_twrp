LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := mtk_fbe_decrypt
LOCAL_SRC_FILES := decrypt.cpp hkdf_extract.cpp aes_gcm_decrypt.cpp
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include $(TOP)/external/openssl/include
LOCAL_CPPFLAGS += -std=c++11
LOCAL_SHARED_LIBRARIES := libcrypto
LOCAL_LDLIBS += -lcrypto
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)
