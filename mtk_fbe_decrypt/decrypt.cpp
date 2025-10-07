#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include "crypto.hpp"

/**
 * hex文字列 → バイト列変換
 */
std::vector<uint8_t> hex_to_bytes(const std::string& hex) {
    std::vector<uint8_t> bytes;
    for (size_t i = 0; i < hex.length(); i += 2) {
        uint8_t byte = std::stoi(hex.substr(i, 2), nullptr, 16);
        bytes.push_back(byte);
    }
    return bytes;
}

int main(int argc, char** argv) {
    if (argc < 5) {
        std::cerr << "Usage: " << argv[0] << " <password> <salt_hex> <iv_hex> <ciphertext_hex> <tag_hex>" << std::endl;
        return 1;
    }

    std::string password = argv[1];
    std::vector<uint8_t> salt = hex_to_bytes(argv[2]);
    std::vector<uint8_t> iv = hex_to_bytes(argv[3]);
    std::vector<uint8_t> ciphertext = hex_to_bytes(argv[4]);
    std::vector<uint8_t> tag = hex_to_bytes(argv[5]);

    std::vector<uint8_t> key = hkdf_extract(password, std::string(salt.begin(), salt.end()));
    std::vector<uint8_t> plaintext;

    bool success = aes_gcm_decrypt(key, iv, tag, ciphertext, plaintext);
    if (!success) {
        std::cerr << "Decryption failed." << std::endl;
        return 2;
    }

    std::cout << "Decryption succeeded. Plaintext:" << std::endl;
    for (auto b : plaintext) {
        std::printf("%02x", b);
    }
    std::cout << std::endl;

    return 0;
}
