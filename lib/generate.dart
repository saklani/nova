import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;

import 'extension.dart';
import 'utils.dart';

String generateChecksumAddress(String privateKey, {int chainId = 1}) {
  privateKey = "0x" + privateKey.strip0x();
  String address = getAddress(privateKey.bigInt()).strip0x();
  String hash = keccak(address.bytes()).hex(with0x: false);
  String checksumAddress = '';
  for (int i = 0; i < address.length; i++) {
    // If ith character is 8 to f then make it uppercase
    checksumAddress += (int.parse(hash[i], radix: 16) > 7)
        ? address[i].toUpperCase()
        : address[i];
  }
  return '0x' + checksumAddress;
}

String generateMnemonic() => bip39.generateMnemonic();

String derivePrivateKey(String mnemonic) {
  final root = bip32.BIP32.fromSeed(bip39.mnemonicToSeed(mnemonic));
  final child = root.derivePath("m/44'/60'/0'/0/0");
  return child.privateKey!.hex();
}
