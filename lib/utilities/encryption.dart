import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:tom_conn/encryption_checker.dart';
import 'package:tom_conn/editPW.dart';
import 'package:tom_conn/accSettings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tom_conn/utilities/auth_page.dart';

class cryptography {

  //Salsa20 encrypt/decrypt
  static final keySalsa20 = encrypt.Key.fromLength(32);
  static final ivSalsa20 = encrypt.IV.fromLength(8);
  static final encrypterSalsa20 = encrypt.Encrypter(encrypt.Salsa20(keySalsa20));

  static encryptSalsa20(text) {
    return encrypterSalsa20.encrypt(text, iv: ivSalsa20);
  }

  static decryptSalsa20(text) {
    return encrypterSalsa20.decrypt(text, iv: ivSalsa20);
  }

  //AES encrypt/decrypt
  static final keyAES = encrypt.Key.fromLength(32);
  static final ivAES = encrypt.IV.fromLength(16);
  static final encrypterAES = encrypt.Encrypter(encrypt.AES(keyAES));

  static encryptAES(text) {
    final encryptedAES = encrypterAES.encrypt(text, iv: ivAES);
    print(encryptedAES.bytes);
    print(encryptedAES.base16);
    print(encryptedAES.base64);

    return encryptedAES;
  }
  static decryptAES(text) {
    return encrypterAES.decrypt(text, iv: ivAES);
  }

  //Salsa to AES (EXPERIMENT)

  static encryptBOTH(text) {
    final encryptedBOTH = encrypterAES.encrypt(text, iv: ivAES);
    return encrypterSalsa20.encrypt(encryptedBOTH.toString(), iv: ivSalsa20);
  }

  static decryptONE(text) { // Decrypts AES (DO NOT CALL)
    return encrypterSalsa20.decrypt(text, iv: ivSalsa20);
  }

  static decryptTWO(text) { // Decrypts Salsa20 (call this function instead)
    return encrypterAES.decrypt(decryptONE(text), iv: ivAES);
  }
}