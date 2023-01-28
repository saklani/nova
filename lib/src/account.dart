import 'client.dart';

/// Represents an ethereum account
class Account {
  /// Public Key Address
  final String address;
  final NovaClient client;

  Account(this.address, this.client);

  /// Get the latest native token balance of the Account
  Future<BigInt> getBalance() => client.getBalance(address);
}
