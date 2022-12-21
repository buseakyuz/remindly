import 'package:encrypt/encrypt.dart';

class EncryptHelper {
  static const String bbfngo = "B?B(H+MbQeThWmZq3t6w9zBC&F)J@NcR";
  static const String cmlkko = "bQeThVmYq3t6w9zSC&F)J@NcRfUjXnZr";
  static const String hashKey = "w!z%C*F-JaNdRgUjXn2r5u8x/A?D(G+K";

  static String encryptAES(String data) {
    final key = Key.fromUtf8(bbfngo);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    return encrypter.encrypt(data, iv: iv).base64;
  }

  static String decryptAES(String data) {
    final key = Key.fromUtf8(bbfngo);
    final encrypter = Encrypter(AES(key));
    return encrypter.decrypt64(data);
  }
}
