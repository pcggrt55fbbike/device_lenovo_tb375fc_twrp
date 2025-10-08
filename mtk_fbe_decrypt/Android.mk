LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := mtk_fbe_decrypt
LOCAL_SRC_FILES := decrypt.cpp hkdf_extract.cpp aes_gcm_decrypt.cpp

# OpenSSL 1.0.x 互換のヘッダとライブラリ
LOCAL_C_INCLUDES += external/openssl/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_SHARED_LIBRARIES += libcrypto

# C++11指定（AOSPでは明示が必要）
LOCAL_CPPFLAGS += -std=c++11

# 明示的に libcrypto をリンク（念のため）
LOCAL_LDLIBS += -lcrypto

# ビルド対象タグ
LOCAL_MODULE_TAGS := optional

# 実行可能ファイルとしてビルド
include $(BUILD_EXECUTABLE)
