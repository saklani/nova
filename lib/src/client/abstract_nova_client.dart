import 'dart:async';

import '../enums/block_tag.dart';
import '../models/block.dart';
import '../models/transaction.dart';

/// Abstract class for implementing
abstract class AbstractNovaClient {

  /// Returns the number of the most recent block on the chain.
  Future<BigInt> blockNumber();

  Future<String> call(Transaction transaction);

  /// Returns the chain ID of the current network
  Future<int> chainId();

  /// Generates and return an estimate of how much gas is necessary to allow
  /// the transaction to complete
  Future<BigInt> estimateGas(Transaction transaction);

  // Returns the current gas price in wei
  Future<BigInt> gasPrice();

  /// Get the current balance of the account
  Future<BigInt> getBalance(
    String address, {
    BigInt? blockNumber,
    BlockTag blockTag = BlockTag.latest,
  });

  Future<Block> getBlockByHash(String hash);

  Future<Block> getBlockByNumber(BigInt number);

  Future<BigInt> getTransactionCount(
    String address, {
    BigInt? blockNumber,
    BlockTag blockTag = BlockTag.latest,
  });

  /// Returns the current Ethereum protocol version
  Future<int> protocolVersion();

  Future<String> sendRawTransaction(String data);

  Future<String> sendTransaction(Transaction transaction);

  /// Returns the EIP-191 signature over the provided data
  Future<String> sign(String address, String message);
}
