import '../client/nova_client.dart';
import '../cryptography/cryptography.dart';
import '../models/export.dart';

import 'account_impl.dart';

/// Represents an Ethereum Externally Owned Accout (EOA)
class Account {
  /// ## Private Key
  /// Externally generated private key, represented by 64 hex characters.
  /// Example: fffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd036415f
  final String privateKey;

  /// ## Chain ID
  /// The current chain ID, defaults to 1 (which is Ethereum Mainnet).
  late final String chainId;

  /// ## Account Address
  /// Public address of the account
  late final String address;

  late final AccountImpl _accountImpl;

  Account({required this.privateKey, required String rpcUrl, chainId = 1}) {
    address = Cryptography.generateChecksumAddress(
      privateKey,
      chainId: chainId,
    );
    _accountImpl = AccountImpl(rpcUrl);
  }

  /// Pass a custom RPC client
  Account.fromClient({
    required this.privateKey,
    required NovaClient client,
    chainId = 1,
  }) {
    address = Cryptography.generateChecksumAddress(
      privateKey,
      chainId: chainId,
    );
    _accountImpl = AccountImpl.fromClient(client);
  }

  /// Get the balance of the Account
  /// On Ethereum it returns the balance in Wei
  Future<BigInt> get balance => _accountImpl.getBalance(address);

  /// Get the nonce of the Account
  /// Nonce represent the total transaction done by the Account
  Future<BigInt> get nonce => _accountImpl.getNonce(address);

  /// Get the current gas price in Wei
  Future<BigInt> get gasPrice => _accountImpl.getGasPrice();

  /// ## signTransaction
  /// Generate a Transaction and Sign it
  /// Example:
  /// ```dart
  ///   Account account = Account(privateKey, rpcUrl);
  ///   Map<String, dynamic> transaction = await account.signTransaction();
  /// ```
  Future<Map<String, dynamic>> signTransaction({
    BigInt? nonce,
    BigInt? gasPrice,
    required BigInt gasLimit,
    required String to,
    BigInt? value,
    String input = '',
    int chainId = 1,
  }) async {
    final transaction = await _generateTransaction(
      nonce: nonce,
      gasPrice: gasPrice,
      gasLimit: gasLimit,
      to: to,
      value: value,
      input: input,
      chainId: chainId,
    );
    final signedTransaction =
        await _accountImpl.signTransaction(privateKey, transaction);
    return signedTransaction.toJson();
  }

  /// ## sendTransaction
  /// Sign and send a transaction
  Future<void> sendTransaction({
    BigInt? nonce,
    BigInt? gasPrice,
    required BigInt gasLimit,
    required String to,
    BigInt? value,
    String input = '',
    int chainId = 1,
  }) async {
    final transaction = await _generateTransaction(
      nonce: nonce,
      gasPrice: gasPrice,
      gasLimit: gasLimit,
      to: to,
      value: value,
      input: input,
      chainId: chainId,
    );
    final signedTransaction =
        await _accountImpl.signTransaction(privateKey, transaction);
    sendRawTransaction(signedTransaction.rawTransaction);
  }

  /// ## sendRawTransaction
  /// Sends a Raw Signed Transaction and returns a Transaction Hash
  Future<String> sendRawTransaction(String data) =>
      _accountImpl.sendRawTransaction(data);

  /// ## estimateGas
  /// Estimate gas for a transaction in Wei
  Future<BigInt> estimateGas({
    BigInt? nonce,
    BigInt? gasPrice,
    required BigInt gasLimit,
    required String to,
    BigInt? value,
    String input = '',
    int chainId = 1,
  }) async {
    final transaction = await _generateTransaction(
      nonce: nonce,
      gasPrice: gasPrice,
      gasLimit: gasLimit,
      to: to,
      value: value,
      input: input,
      chainId: chainId,
    );
    return await _accountImpl.estimateGas(transaction);
  }

  /// Helper Method
  Future<Transaction> _generateTransaction({
    BigInt? nonce,
    BigInt? gasPrice,
    required BigInt gasLimit,
    required String to,
    BigInt? value,
    String input = '',
    int chainId = 1,
  }) async {
    nonce ??= await this.nonce;
    gasPrice ??= await this.gasPrice;
    value ??= BigInt.zero;
    return Transaction(
      nonce: nonce,
      gasPrice: gasPrice,
      gasLimit: gasLimit,
      to: to,
      value: value,
      input: input,
      chainId: chainId,
    );
  }
}
