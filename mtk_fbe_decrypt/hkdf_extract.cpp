#include <openssl/hmac.h>
#include <openssl/evp.h>
#include <cstring>
#include <vector>
#include <string>

// HKDF-Extract: HMAC(salt, IKM)
void hkdf_extract(const unsigned char* salt, size_t salt_len,
                  const unsigned char* ikm, size_t ikm_len,
                  unsigned char* prk, unsigned int* prk_len) {
    unsigned char default_salt[EVP_MAX_MD_SIZE] = {0};
    if (!salt || salt_len == 0) {
        salt = default_salt;
        salt_len = EVP_MD_size(EVP_sha256());
    }
    HMAC(EVP_sha256(), salt, salt_len, ikm, ikm_len, prk, prk_len);
}

// HKDF-Expand: HMAC(PRK, T(i-1) | info | i)
std::vector<uint8_t> hkdf_expand(const unsigned char* prk, size_t prk_len,
                                 const std::string& info, size_t length) {
    std::vector<uint8_t> okm(length);
    size_t hash_len = EVP_MD_size(EVP_sha256());

    unsigned char T[EVP_MAX_MD_SIZE];
    size_t T_len = 0;
    size_t pos = 0;
    unsigned char ctr = 1;

    while (pos < length) {
        HMAC_CTX* ctx = HMAC_CTX_new();
        HMAC_Init_ex(ctx, prk, prk_len, EVP_sha256(), nullptr);

        if (T_len > 0) HMAC_Update(ctx, T, T_len);
        HMAC_Update(ctx, reinterpret_cast<const unsigned char*>(info.data()), info.size());
        HMAC_Update(ctx, &ctr, 1);

        HMAC_Final(ctx, T, reinterpret_cast<unsigned int*>(&T_len));
        HMAC_CTX_free(ctx);

        size_t copy_len = std::min(length - pos, T_len);
        memcpy(okm.data() + pos, T, copy_len);
        pos += copy_len;
        ctr++;
    }

    return okm;
}

// 高レベルAPI: password + salt → 32byte key
std::vector<uint8_t> hkdf_extract(const std::string& password, const std::string& salt) {
    unsigned char prk[EVP_MAX_MD_SIZE];
    unsigned int prk_len = 0;

    hkdf_extract(reinterpret_cast<const unsigned char*>(salt.data()), salt.size(),
                 reinterpret_cast<const unsigned char*>(password.data()), password.size(),
                 prk, &prk_len);

    return hkdf_expand(prk, prk_len, "keystore2", 32); // 256bit key
}
