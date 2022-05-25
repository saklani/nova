# Supernova

Supernova is an Ethereum Wallet SDK in Dart.

# Getting Started

## Sign a Transaction

Generate signed transaction

```dart
import "package:supernova/supernova.dart";

void main() async {
  final web3 = Wallet(
    "0x4646464646464646464646464646464646464646464646464646464646464646",
    "ws://your-json-rpc-websocket.test",
  );
  final signedTransaction = await web3.sign(
    nonce: 9,
    to: "0x3535353535353535353535353535353535353535",
    gasLimit: BigInt.from(21000),
    gasPrice: BigInt.from(20 * pow(10, 9)),
    value: BigInt.from(pow(10, 18)),
    chainId: 1,
  );
}
```

## Send a Transaction

Quickly sign and send a transaction.

```dart
import "package:supernova/supernova.dart";

void main() async {
  final web3 = Wallet(
    "0x4646464646464646464646464646464646464646464646464646464646464646",
    "ws://your-json-rpc-websocket.test",
  );
  final signedTransaction = await web3.send(
    nonce: 9,
    to: "0x3535353535353535353535353535353535353535",
    gasLimit: BigInt.from(21000),
    gasPrice: BigInt.from(20 * pow(10, 9)),
    value: BigInt.from(pow(10, 18)),
    chainId: 1,
  );
}
```

## Send a raw transaction

Send a raw transaction if that is what you need.

```dart
import "package:supernova/supernova.dart";

void main() async {
  final web3 = Wallet(
    "0x4646464646464646464646464646464646464646464646464646464646464646",
    "ws://your-json-rpc-websocket.test",
  );
  await web3.sendRawTransaction(
    '0xf86c098504a817c800825208943535353535353535353535353535353535353535880de0b6b3a76400008025a028ef61340bd939bc2195fe537567866003e1a15d3c71ff63e1590620aa636276a067cbe9d8997f761aecb703304b3800ccf555c9f3dc64214b297fb1966a3b6d83',
  );
}
```


## JSON RPC API

| Function                                   |   |
|--------------------------------------------|---|
| eth_protocolVersion                        | ✅|
| eth_syncing                                |   |
| eth_coinbase                               |   |
| eth_mining                                 |   |
| eth_hashrate                               |   |
| eth_gasPrice                               | ✅|
| eth_accounts                               |   |
| eth_blockNumber                            | ✅|
| eth_getBalance                             | ✅|
| eth_getStorageAt                           |   |
| eth_getTransactionCount                    | ✅|
| eth_getBlockTransactionCountByHash         |   |
| eth_getBlockTransactionCountByNumber       |   |
| eth_getUncleCountByBlockHash               |   |
| eth_getUncleCountByBlockNumber             |   |
| eth_getCode                                |   |
| eth_sign                                   | ✅|
| eth_signTransaction                        |   |
| eth_sendTransaction                        | ✅|
| eth_sendRawTransaction                     | ✅|
| eth_call                                   | ✅|
| eth_estimateGas                            | ✅|
| eth_getBlockByHash                         | ✅|
| eth_getBlockByNumber                       | ✅|
| eth_getTransactionByHash                   |   |
| eth_getTransactionByBlockHashAndIndex      |   |
| eth_getTransactionByBlockNumberAndIndex    |   |
| eth_getTransactionReceipt                  |   |
| eth_getUncleByBlockHashAndIndex            |   |
| eth_getUncleByBlockNumberAndIndex          |   |
| eth_getCompilers                           |   |
| eth_newFilter                              |   |
| eth_newBlockFilter                         |   |
| eth_newPendingTransactionFilter            |   |
| eth_uninstallFilter                        |   |
| eth_getFilterChanges                       |   |
| eth_getFilterLogs                          |   |
| eth_getLogs                                |   |
| eth_getWork                                |   |
| eth_submitWork                             |   | 
| eth_submitHashrate                         |   |