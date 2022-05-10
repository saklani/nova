import 'package:nova/nova.dart';

import 'token.dart';

class Account {
  /// Public Key Address
  final String address;
  final Web3Client client;

  Account(this.address, this.client);

  /// Get the latest native token balance of the Account
  Future<BigInt> getBalance() => client.getBalance(address);

  /// Get a list of tokens in the account
  Future<List<Token>> getTokens() => throw UnimplementedError();
}
