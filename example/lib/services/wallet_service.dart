import 'package:supernova/supernova.dart';

class Web3 {
  String _privateKey;
  late Wallet wallet;
  final String url;
  final int chainId;

  Web3(this._privateKey, this.url, {this.chainId = 1}) {
    wallet = Wallet(_privateKey, url, chainId: chainId);
  }

  factory Web3.fromMnemonic(String mnemonic, String url, {int chainId = 1}) {
    String privateKey = derivePrivateKey(mnemonic);
    return Web3(privateKey, url, chainId: chainId);
  }

  Future<BigInt> get balance => wallet.getBalance();

  Future<BigInt> estimateGas({
    required String to,
    required BigInt value,
  }) async =>
      wallet.estimateGas(
        to: to,
        gasLimit: BigInt.from(21000),
        value: value,
      );

  Future<void> sendTransaction({
    required String to,
    required BigInt value,
  }) async {
    final signedTransaction = await wallet.sign(
      gasLimit: BigInt.from(21000),
      to: to,
      value: value,
    );
    final transactionHash =
        await wallet.sendRawTransaction(signedTransaction.rawTransaction);
    print(transactionHash);
  }
}
