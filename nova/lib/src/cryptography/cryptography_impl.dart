import 'dart:typed_data';

import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;
import 'package:meta/meta.dart';
import 'package:pointycastle/export.dart';
import 'package:rlp/rlp.dart';

import '../extension.dart';
import '../models/signed_data.dart';

@internal
class CryptographyImpl {
  static Uint8List encodeU(Uint8List data) => Rlp.encode(data);

  static Uint8List encode(List<BigInt> data) => Rlp.encode(data);

  static Uint8List keccak(Uint8List data) => KeccakDigest(256).process(data);

  static BigInt getPublicKey(BigInt privateKey) {
    ECPoint point = (ECCurve_secp256k1().G * privateKey)!;
    return point.getEncoded(false).sublist(1).bigInt();
  }

  static String getAddress(BigInt privateKey) {
    BigInt publicKey = getPublicKey(privateKey);
    return '0x' + keccak(publicKey.bytes()).hex(with0x: false).substring(24);
  }

  static String derivePrivateKey(String mnemonic) {
    final root = bip32.BIP32.fromSeed(bip39.mnemonicToSeed(mnemonic));
    final child = root.derivePath("m/44'/60'/0'/0/0");
    return child.privateKey!.hex();
  }

  static String generateMnemonic() => bip39.generateMnemonic();

  static String generateChecksumAddress(String privateKey, {int chainId = 1}) {
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

  static Future<SignedData> sign(String privateKey, String data) =>
      signInternal(
        privateKey,
        data.bigBytes(),
      );

  static Future<SignedData> signInternal(
    String privateKey,
    List<BigInt> data,
  ) async {
    final parameters = ECCurve_secp256k1();
    final hash = keccak(encode(data));
    final ecdsa = NormalizedECDSASigner(
      ECDSASigner(null, HMac(SHA256Digest(), 64)),
      enforceNormalized: true,
    );
    final key = ECPrivateKey(
      privateKey.bigInt(),
      parameters,
    );
    ecdsa.init(true, PrivateKeyParameter(key));
    final signature = ecdsa.generateSignature(hash) as ECSignature;
    return SignedData(
      hash: hash.hex(),
      r: signature.r,
      s: signature.s,
    );
  }

  /// https://github.com/web3j/web3j/blob/c0b7b9c2769a466215d416696021aa75127c2ff1/crypto/src/main/java/org/web3j/crypto/Sign.java#L129
  static BigInt? recoverFromSignature(
    int recoveryId,
    BigInt r,
    BigInt s,
    Uint8List hash,
  ) {
    final parameters = ECCurve_secp256k1();
    BigInt n = parameters.n;
    BigInt i = BigInt.from(recoveryId ~/ 2);
    BigInt x = r + (i * n);
    BigInt prime = BigInt.parse(
      '0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f',
    );
    if (x.compareTo(prime) >= 0) {
      // Cannot have point co-ordinates larger than this as everything takes place modulo Q.
      return null;
    }
    ECPoint R = parameters.curve.decompressPoint(recoveryId % 1, x);
    if (!(R * n)!.isInfinity) return null;
    BigInt e = hash.bigInt();
    BigInt eI = (BigInt.zero - e) % n;
    BigInt rI = r.modInverse(n);
    BigInt srI = (rI * s) % n;
    BigInt eIrI = (rI * eI) % n;
    final q = (parameters.G * eIrI)! + (R * srI);
    final Uint8List result = q!.getEncoded(false).sublist(1);
    return result.bigInt();
  }
}
