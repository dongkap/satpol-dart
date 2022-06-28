import 'package:encrypt/encrypt.dart';
import 'package:convert/convert.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EncryptionService {
  static String encryptAES({
    required String plainText,
  }) {
    final String secretKey = dotenv.env['AES_KEY'] ?? '';
    final key = Key.fromUtf8(secretKey);
    const int ivSize = 128;
    final IV iv = IV.fromSecureRandom(ivSize ~/ 8);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final Encrypted encrypted = encrypter.encrypt(plainText, iv: iv);
    return hex.encode(iv.bytes) + encrypted.base64.toString();
  }
}
