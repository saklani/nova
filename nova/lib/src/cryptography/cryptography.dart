import 'dart:typed_data';

import 'cryptography_impl.dart';

/// The public Cryptography class
class Cryptography {
  /// ## encode
  /// Encodes a List<BigInt> data into RLP.
  ///
  /// ### Why List<BigInt>?
  /// `BigInt` makes it possible to represent address as integers.
  /// Address tend to be very large integers and doing this is just convenient.
  /// To convert a `String` to `List<BigInt>` just use the `bigBytes()`.
  static Uint8List encode(List<BigInt> data) => CryptographyImpl.encode(data);

  /// ## keccak
  /// Returns a keccak256 of bytes
  static Uint8List keccak(Uint8List data) => CryptographyImpl.keccak(data);

  /// ## getPublicKey
  /// Returns the public key from a private key
  static BigInt getPublicKey(BigInt privateKey) =>
      CryptographyImpl.getPublicKey(privateKey);

  /// ## getAddress
  /// Returns the public address from a private key
  static String getAddress(BigInt privateKey) =>
      CryptographyImpl.getAddress(privateKey);

  /// ## derivePrivateKey
  /// Derive the private key from a seed phrase
  static String derivePrivateKey(String mnemonic) =>
      CryptographyImpl.derivePrivateKey(mnemonic);

  static String generateMnemonic() => CryptographyImpl.generateMnemonic();

  /// ## generateChecksumAddress
  /// Return the calculated checksum address from a privateKey, and chainId
  static String generateChecksumAddress(String privateKey, {int chainId = 1}) =>
      CryptographyImpl.generateChecksumAddress(
        privateKey,
        chainId: chainId,
      );

  /// ## sign
  /// Sign any data with a privateKey
  /// Returns a map containing
  /// r - The calculated r
  /// s - The calculated s
  /// hash - hashed data
  static Future<Map<String, dynamic>> sign(
    String privateKey,
    String data,
  ) async {
    final signedData = await CryptographyImpl.sign(data, privateKey);
    return signedData.toJson();
  }
}
