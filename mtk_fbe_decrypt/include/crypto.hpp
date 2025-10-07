#pragma once
#include <string>
#include <vector>

/**
 * パスワードとソルトから鍵を導出（HKDF-SHA256）
 */
std::vector<uint8_t> hkdf_extract(const std::string& password, const std::string& salt);

/**
 * AES-GCMで復号処理を行う
 * @param key 鍵（32バイト）
 * @param iv 初期化ベクトル（12バイト）
 * @param tag 認証タグ（16バイト）
 * @param ciphertext 暗号化されたデータ
 * @param plaintext 復号結果（出力）
 * @return 成功なら true
 */
bool aes_gcm_decrypt(const std::vector<uint8_t>& key,
                     const std::vector<uint8_t>& iv,
                     const std::vector<uint8_t>& tag,
                     const std::vector<uint8_t>& ciphertext,
                     std::vector<uint8_t>& plaintext);
