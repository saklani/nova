import 'dart:typed_data';

import 'package:pointycastle/export.dart';

import 'extension.dart';

/// apply keccak256 to a List<int>.
Uint8List keccak(List<int> data) {
  return KeccakDigest(256).process(Uint8List.fromList(data));
}

BigInt getPublicKey(BigInt privateKey) {
  ECPoint point = (ECCurve_secp256k1().G * privateKey)!;
  return point.getEncoded(false).sublist(1).bigInt();
}

String getAddress(BigInt privateKey) {
  BigInt publicKey = getPublicKey(privateKey);
  return '0x' + keccak(publicKey.bytes()).hex(with0x: false).substring(24);
}

String getChecksumAddress(String address, int chainId) {
  String sanitizedAddress = address.trim().toLowerCase().strip0x();
  String hash = keccak((chainId.toString() + sanitizedAddress).bytes())
      .hex(with0x: false);
  String checksumAddress = '';
  for (int i = 0; i < address.length; i++) {
    // If ith character is 8 to f then make it uppercase
    checksumAddress += (int.parse(hash[i], radix: 16) > 7)
        ? address[i].toUpperCase()
        : address[i];
  }
  return '0x' + checksumAddress;
}
