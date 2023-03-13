import 'dart:typed_data';

import 'package:pointycastle/export.dart';

import '../extensions.dart';
import 'algorithm.dart';

Uint8List calculatePublicKey(BigInt privateKey) {
  ECPoint point = (ECCurve_secp256k1().G * privateKey)!;
  return point.getEncoded(false).sublist(1);
}

/// Hashes a message
Uint8List hashMessage(String message) {
  Uint8List data = message.toBytes();
  Uint8List prefix = "\x19Ethereum Signed Message:\n${data.length}".toBytes();
  return keccak(Uint8List.fromList(prefix + data));
}

/// https://github.com/web3j/web3j/blob/c0b7b9c2769a466215d416696021aa75127c2ff1/crypto/src/main/java/org/web3j/crypto/Sign.java#L129
BigInt? recoverFromSignature(
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
  BigInt e = hash.toBigInt();
  BigInt eI = (BigInt.zero - e) % n;
  BigInt rI = r.modInverse(n);
  BigInt srI = (rI * s) % n;
  BigInt eIrI = (rI * eI) % n;
  final q = (parameters.G * eIrI)! + (R * srI);
  final Uint8List result = q!.getEncoded(false).sublist(1);
  return result.toBigInt();
}

/// Sign arbitary data using a private key
Future<Map<String, String>> sign({
  required String key,
  required String message,
}) async {
  final parameters = ECCurve_secp256k1();

  final hash = hashMessage(message);
  final privateKey = ECPrivateKey(key.toBigInt(), parameters);

  final ecdsa = NormalizedECDSASigner(
    ECDSASigner(null, HMac(SHA256Digest(), 64)),
    enforceNormalized: true,
  );

  ecdsa.init(true, PrivateKeyParameter(privateKey));
  final signature = ecdsa.generateSignature(hash) as ECSignature;
  final r = signature.r.toHex();
  final s = signature.s.toHex();
  // Public key to sign the transaction.
  Uint8List publicKey = calculatePublicKey(key.toBigInt());

  // Recovery ID v is 0 or 1 depending on whether R or R' is used as the
  int v = -1;
  for (int i = 0; i < 4; i++) {
    BigInt? k = recoverFromSignature(i, r.toBigInt(), s.toBigInt(), hash);
    if (k != null && k == publicKey.toBigInt()) {
      v = i + 27;
      break;
    }
  }
  return {
    'message': message,
    'hash': hash.toHex(),
    'r': r,
    's': s,
    'v': v.toRadixString(16),
    'signature': '0x${r.strip0x()}${s.strip0x()}${v.toRadixString(16)}'
  };
}

Future<Map<String, String>> signHashedBytes({
  required String key,
  required Uint8List hashedMessage,
  int chainId = 1,
}) async {
  final parameters = ECCurve_secp256k1();

  final privateKey = ECPrivateKey(key.toBigInt(), parameters);

  final ecdsa = NormalizedECDSASigner(
    ECDSASigner(null, HMac(SHA256Digest(), 64)),
    enforceNormalized: true,
  );

  ecdsa.init(true, PrivateKeyParameter(privateKey));
  final signature = ecdsa.generateSignature(hashedMessage) as ECSignature;
  final r = signature.r.toHex();
  final s = signature.s.toHex();
  // Public key to sign the transaction.
  Uint8List publicKey = calculatePublicKey(key.toBigInt());

  // Recovery ID v is 0 or 1 depending on whether R or R' is used as the
  int v = -1;
  for (int i = 0; i < 4; i++) {
    BigInt? k =
        recoverFromSignature(i, r.toBigInt(), s.toBigInt(), hashedMessage);
    if (k != null && k == publicKey.toBigInt()) {
      v = i + 2 * chainId + 35;
      break;
    }
  }
  return {
    'hash': hashedMessage.toHex(),
    'r': r,
    's': s,
    'v': v.toRadixString(16),
    'signature': '0x${r.strip0x()}${s.strip0x()}${v.toRadixString(16)}'
  };
}
