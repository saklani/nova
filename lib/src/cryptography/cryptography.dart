import 'dart:typed_data';

import 'cryptography_impl.dart';

class Cryptography {
  static Uint8List encode(List<BigInt> data) => CryptographyImpl.encode(data);

  static Uint8List keccak(Uint8List data) => CryptographyImpl.keccak(data);

  static BigInt getPublicKey(BigInt privateKey) =>
      CryptographyImpl.getPublicKey(privateKey);

  static String getAddress(BigInt privateKey) =>
      CryptographyImpl.getAddress(privateKey);

  static String derivePrivateKey(String mnemonic) =>
      CryptographyImpl.derivePrivateKey(mnemonic);
  static String generateMnemonic() => CryptographyImpl.generateMnemonic();

  static String generateChecksumAddress(String privateKey, {int chainId = 1}) =>
      CryptographyImpl.generateChecksumAddress(
        privateKey,
        chainId: chainId,
      );

  static Future<Map<String, dynamic>> sign(
    String privateKey,
    String data,
  ) async {
    final signedData = await CryptographyImpl.sign(data, privateKey);
    return signedData.toJson();
  }
}
