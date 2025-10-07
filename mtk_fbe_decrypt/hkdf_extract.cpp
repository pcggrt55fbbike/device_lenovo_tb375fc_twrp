#include <openssl/evp.h>
#include <openssl/kdf.h>
#include <vector>
#include <string>

std::vector<uint8_t> hkdf_extract(const std::string& password, const std::string& salt) {
    std::vector<uint8_t> key(32); // 256bit key

    EVP_PKEY_CTX *pctx = EVP_PKEY_CTX_new_id(EVP_PKEY_HKDF, nullptr);
    if (!pctx) return {};

    if (EVP_PKEY_derive_init(pctx) <= 0) return {};
    if (EVP_PKEY_CTX_set_hkdf_mode(pctx, EVP_PKEY_HKDEF_MODE_EXTRACT_AND_EXPAND) <= 0) return {};
    if (EVP_PKEY_CTX_set_hkdf_md(pctx, EVP_sha256()) <= 0) return {};
    if (EVP_PKEY_CTX_set1_hkdf_salt(pctx, salt.data(), salt.size()) <= 0) return {};
    if (EVP_PKEY_CTX_set1_hkdf_key(pctx, password.data(), password.size()) <= 0) return {};
    if (EVP_PKEY_CTX_add1_hkdf_info(pctx, "keystore2", 9) <= 0) return {};

    size_t len = key.size();
    if (EVP_PKEY_derive(pctx, key.data(), &len) <= 0) {
        EVP_PKEY_CTX_free(pctx);
        return {};
    }

    EVP_PKEY_CTX_free(pctx);
    return key;
}
