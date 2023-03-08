import 'dart:typed_data';

import 'package:convex/convex.dart';

import '../constants.dart';
import 'wordlist.dart';

const keys = Keys._();

class Keys {
  const Keys._();


  /// Generates a BIP39 complatible mnemonic
  List<String> generateMnemonic({int strength = 128}) {
    if (strength % 32 != 0) {
      throw ArgumentError(invalidStrength);
    }
    final entropy = crypto.randomBytes(strength ~/ 4);
    final entropyBits = entropy.toBinary();
    final checksumBits = _deriveChecksumBits(entropy);
    final bits = entropyBits + checksumBits;
    final regex = RegExp(r".{1,11}", caseSensitive: false, multiLine: false);
    final chunks = regex
        .allMatches(bits)
        .map((match) => match.group(0)!)
        .toList(growable: false);
    List<String> words =
        chunks.map((binary) => WORDLIST[int.parse(binary, radix: 2)]).toList();
    return words;
  }

  String _deriveChecksumBits(Uint8List entropy) {
    final entropyLength = entropy.length * 8;
    final checksum = entropyLength ~/ 32;
    final hash = crypto.sha256(entropy);
    return hash.toBinary().substring(0, checksum);
  }

  Uint8List mnemonicToSeed(String mnemonic) =>
      crypto.argon2(data: mnemonic.toBytes());

  String getAddress(String privateKey) {
    String publicKey = crypto.calculatePublicKey(privateKey.toBigInt()).toHex();
    return '0x${crypto.keccak(publicKey.toBytes()).toHex(with0x: false).substring(24)}';
  }

  String generateChecksumAddress(String privateKey, {int chainId = 1}) {
    privateKey = "0x${privateKey.strip0x()}";
    String address = getAddress(privateKey).strip0x();
    String hash = crypto.keccak(address.toBytes()).toHex(with0x: false);
    String checksumAddress = '';
    for (int i = 0; i < address.length; i++) {
      // If ith character is 8 to f then make it uppercase
      checksumAddress += (int.parse(hash[i], radix: 16) > 7)
          ? address[i].toUpperCase()
          : address[i];
    }
    return '0x$checksumAddress';
  }
}
