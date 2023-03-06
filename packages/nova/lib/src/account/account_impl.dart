import 'dart:core';

import 'package:convex/convex.dart';
import 'package:meta/meta.dart';

import '../client/nova_client.dart';
import '../models/signed_transaction.dart';
import '../models/transaction.dart';

/// Implementation of [Account]
@internal
class AccountImpl {
  // RPC Client
  // Client can be used to communicate with Ethereum via RPC calls.
  late final NovaClient _client;

  AccountImpl(String rpcUrl) {
    _client = NovaClient(rpcUrl);
  }

  // Pass a custom RPC client
  AccountImpl.fromClient(NovaClient client) {
    _client = client;
  }

  Future<BigInt> estimateGas(Transaction transaction) async {
    return await _client.estimateGas(transaction) * transaction.gasPrice;
  }

  Future<BigInt> getBalance(String address) => _client.getBalance(address);
  Future<BigInt> getGasPrice() => _client.gasPrice();

  Future<BigInt> getNonce(String address) =>
      _client.getTransactionCount(address);

  /// Sends a Raw Signed Transaction and returns a Transaction Hash
  Future<String> sendRawTransaction(String data) =>
      _client.sendRawTransaction(data);

  Future<void> sendTransaction(SignedTransaction signedTransaction) =>
      sendRawTransaction(signedTransaction.rawTransaction);

  Future<SignedTransaction> signTransaction(
    String privateKey,
    Transaction transaction,
  ) async {
    final data = crypto.encode(transaction.toBigInts());
    final hashedMessage = crypto.keccak(data);
    final signedData = await crypto.signHashedBytes(
      key: privateKey,
      hashedMessage: hashedMessage,
      chainId: transaction.chainId,
    );
    BigInt r = signedData['r']!.toBigInt(), s = signedData['s']!.toBigInt();
    int v = int.parse(signedData['v']!, radix: 16);

    final List<BigInt> rawData = [
      transaction.nonce,
      transaction.gasPrice,
      transaction.gasLimit,
      BigInt.parse(transaction.to),
      transaction.value,
      transaction.input.isEmpty ? BigInt.zero : BigInt.parse(transaction.input),
      BigInt.from(v),
      r,
      s,
    ];
    final rawRlp = crypto.encode(rawData);
    final rawTransactionHash = crypto.keccak(rawRlp);
    return SignedTransaction(
      nonce: transaction.nonce,
      gasPrice: transaction.gasPrice,
      gasLimit: transaction.gasLimit,
      to: transaction.to,
      value: transaction.value,
      input: transaction.input,
      messageHash: signedData['hash']!,
      v: v,
      r: r,
      s: s,
      rawTransaction: rawRlp.toHex(),
      transactionHash: rawTransactionHash.toHex(),
    );
  }
}
