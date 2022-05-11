import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:nova/nova.dart';
import 'package:pointycastle/export.dart';
import 'package:rlp/rlp.dart';

import 'core.dart';
import 'utils.dart';

class Wallet extends Account {
  /// 1. Sign a transaction using the private key
  /// 2. Sign and send a transaction using the private key
  final String privateKey;

  Wallet(
    this.privateKey,
    String url,
  ) : super(
          _getAddress(decodeBigIntWithSign(1, privateKey.codeUnits)),
          Web3Client(url),
        );

  Future<SignedTransaction> signTransaction(Transaction transaction) async {
    _transactionSignable(transaction);
    final messageHash = _messageHash(transaction);
    final parameters = ECCurve_secp256k1();
    final ecdsa = ECDSASigner(null, HMac(SHA256Digest(), 64));
    final key = ECPrivateKey(
      BigInt.parse(privateKey),
      parameters,
    );

    ecdsa.init(true, PrivateKeyParameter(key));
    final signature = ecdsa.generateSignature(messageHash) as ECSignature;

    // Public key to sign the transaction.
    BigInt publicKey = _getPublicKey(BigInt.parse(privateKey), parameters);

    // Recovery ID v is 0 or 1 depending on whether R or R' is used as the
    int v = -1;
    for (int i = 0; i < 4; i++) {
      BigInt? k = _recoverFromSignature(
        i,
        signature.r,
        signature.s,
        messageHash,
        parameters,
      );
      if (k != null && k == publicKey) {
        v = i;
        break;
      }
    }

    final rawTransaction = Rlp.encode([
      transaction.nonce,
      transaction.gasPrice,
      transaction.gasLimit,
      transaction.to,
      transaction.value,
      transaction.input,
      transaction.chainId,
      v,
      signature.r,
      signature.s,
    ].map((e) => BigInt.parse(e.toString())).toList());

    return SignedTransaction(
      nonce: transaction.nonce!,
      gasPrice: transaction.gasPrice!,
      gasLimit: transaction.gasLimit!,
      to: transaction.to,
      value: transaction.value ?? BigInt.zero,
      input: transaction.input ?? '',
      messageHash: '0x${hex.encode(messageHash)}',
      v: v,
      r: signature.r,
      s: signature.s,
      rawTransaction: '0x${hex.encode(rawTransaction)}',
      transactionHash:
          '0x${hex.encode(KeccakDigest(256).process(rawTransaction))}',
    );
  }

  /// Accepts a transaction and returns a signed transaction.
  Future<SignedTransaction> sign({
    BigInt? nonce,
    BigInt? gasPrice,
    required BigInt gasLimit,
    required String to,
    BigInt? value,
    String? input,
    int? chainId,
  }) async {
    nonce ??= await client.getTransactionCount(address);
    gasPrice ??= await client.gasPrice();
    value ??= BigInt.zero;
    input ??= '';
    chainId ??= await client.chainId();

    Transaction transaction = Transaction(
      nonce: nonce.toInt(),
      gasPrice: gasPrice,
      gasLimit: gasLimit,
      to: to,
      value: value,
      input: input,
      chainId: chainId,
    );
    return signTransaction(transaction);
  }

  /// Throws if the transaction cannot be signed.
  void _transactionSignable(Transaction transaction) {
    if (transaction.nonce == null) {
      throw Exception('nonce cannot be null');
    } else if (transaction.nonce!.isNegative) {
      throw Exception('nonce cannot be negative');
    }
    if (transaction.gasPrice == null) {
      throw Exception('gasPrice cannot be null');
    } else if (transaction.gasPrice!.isNegative) {
      throw Exception('gasPrice cannot be negative');
    }

    if (transaction.gasLimit == null) {
      throw Exception('gasLimit cannot be null');
    } else if (transaction.gasLimit!.isNegative) {
      throw Exception('gasLimit cannot be negative');
    }
  }

  Future<void> sendTransaction(SignedTransaction signedTransaction) {
    return sendRawTransaction(signedTransaction.rawTransaction);
  }

  /// Sends a Raw Signed Transaction and returns a Transaction Hash
  Future<void> sendRawTransaction(String data) async {
    final response = await client.sendRawTransaction(data);
    print(response);
  }

  /// Takes a message and does the following
  /// 1. RLP Encodes the message
  /// 2. Applies a Keccak256 hash to it
  Uint8List _messageHash(Transaction transaction) {
    List<dynamic> data = [
      transaction.nonce,
      transaction.gasPrice,
      transaction.gasLimit,
      BigInt.parse(transaction.to),
      transaction.value ?? 0,
      transaction.input ?? 0,
      transaction.chainId,
      0,
      0
    ].map((e) => BigInt.parse(e.toString())).toList();
    final keccak = KeccakDigest(256);
    return keccak.process(Uint8List.fromList(Rlp.encode(data)));
  }

  /// https://github.com/web3j/web3j/blob/c0b7b9c2769a466215d416696021aa75127c2ff1/crypto/src/main/java/org/web3j/crypto/Sign.java#L129
  BigInt? _recoverFromSignature(
    int recoveryId,
    BigInt r,
    BigInt s,
    Uint8List messageHash,
    ECDomainParameters parameters,
  ) {
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

    BigInt e = decodeBigIntWithSign(1, messageHash);
    BigInt eI = (BigInt.zero - e) % n;
    BigInt rI = r.modInverse(n);
    BigInt srI = (rI * s) % n;
    BigInt eIrI = (rI * eI) % n;

    final q = (parameters.G * eIrI)! + (R * srI);

    return decodeBigIntWithSign(1, q!.getEncoded(false).sublist(1));
  }

  static BigInt _getPublicKey(
    BigInt privateKey,
    ECDomainParameters parameters,
  ) {
    ECPoint point = (parameters.G * privateKey)!;
    return decodeBigIntWithSign(1, point.getEncoded(false).sublist(1));
  }

  static String _getAddress(BigInt privateKey) {
    BigInt publicKey = _getPublicKey(privateKey, ECCurve_secp256k1());
    final keccak = KeccakDigest(256);
    return '0x${hex.encode(keccak.process(encodeBigInt(publicKey))).substring(24)}';
  }

  String generateMnemonic() => throw UnimplementedError();
}
