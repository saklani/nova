import 'package:meta/meta.dart';

import '../cryptography/cryptography_impl.dart';
import '../models/export.dart';
import '../client.dart';
import '../extension.dart';

/// Implementation of [Account]
@internal
class AccountImpl {
  // RPC Client
  // Client can be used to communicate with Ethereum via RPC calls.
  late final NovaClient _client;

  AccountImpl(String rpcUrl) {
    _client = NovaClient(rpcUrl);
  }

  Future<BigInt> getBalance(String address) => _client.getBalance(address);
  Future<BigInt> getNonce(String address) =>
      _client.getTransactionCount(address);
  Future<BigInt> getGasPrice() => _client.gasPrice();

  Future<SignedTransaction> signTransaction(
    String privateKey,
    Transaction transaction,
  ) async {
    final data = transaction.toList();
    final hash = CryptographyImpl.keccak(CryptographyImpl.encode(data));
    final signedData = await CryptographyImpl.signInternal(
      privateKey,
      data,
    );
    // Public key to sign the transaction.
    BigInt publicKey = CryptographyImpl.getPublicKey(privateKey.bigInt());

    // Recovery ID v is 0 or 1 depending on whether R or R' is used as the
    int v = -1;
    for (int i = 0; i < 4; i++) {
      BigInt? k = CryptographyImpl.recoverFromSignature(
        i,
        signedData.r,
        signedData.s,
        hash,
      );
      if (k != null && k == publicKey) {
        v = i + 2 * transaction.chainId + 35;
        break;
      }
    }
    final List<BigInt> rawData = [
      transaction.nonce,
      transaction.gasPrice,
      transaction.gasLimit,
      BigInt.parse(transaction.to),
      transaction.value,
      transaction.input.isEmpty ? BigInt.zero : BigInt.parse(transaction.input),
      BigInt.from(v),
      signedData.r,
      signedData.s,
    ];
    final rawRlp = CryptographyImpl.encode(rawData);
    final rawTransactionHash = CryptographyImpl.keccak(rawRlp);

    return SignedTransaction(
      nonce: transaction.nonce,
      gasPrice: transaction.gasPrice,
      gasLimit: transaction.gasLimit,
      to: transaction.to,
      value: transaction.value,
      input: transaction.input,
      messageHash: signedData.hash,
      v: v,
      r: signedData.r,
      s: signedData.s,
      rawTransaction: rawRlp.hex(),
      transactionHash: rawTransactionHash.hex(),
    );
  }

  Future<void> sendTransaction(SignedTransaction signedTransaction) =>
      sendRawTransaction(signedTransaction.rawTransaction);

  /// Sends a Raw Signed Transaction and returns a Transaction Hash
  Future<String> sendRawTransaction(String data) =>
      _client.sendRawTransaction(data);

  Future<BigInt> estimateGas(Transaction transaction) async {
    return await _client.estimateGas(transaction) * transaction.gasPrice;
  }
}
