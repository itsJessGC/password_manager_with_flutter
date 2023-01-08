import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:encrypt/encrypt.dart' as encrypt;

class Encrypted_Val{
  static final key = encrypt.Key.fromUtf8(''); //32 chars
  static final iv = encrypt.IV.fromUtf8(''); //16 chars

  //encrypt
  static String encryptMyData(String text) {
    final e = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final encrypted_data = e.encrypt(text, iv: iv);
    return encrypted_data.base64;
  }

  //dycrypt
  static String decryptMyData(String text) {
    final e = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final decrypted_data = e.decrypt(encrypt.Encrypted.fromBase64(text), iv: iv);
    return decrypted_data;
  }
}