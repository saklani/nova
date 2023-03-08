# Nova

Nova can be used to generate eth wallets, sign transaction, and send them. 
It also implements part of the Ethereum JSON-RPC API specification.

## Account 
The library has built-in support for managing ethereum private keys, and signatures. 
It provides functionality for generating, signing, and sending transactions. 

### Use your own seed phrase or private key
Load an Account with a seed phrase

```dart
import "package:nova/nova.dart";

void main() {
  
  // Your seed phrase
  final seedPhrase = "seed sock milk update focus rotate barely fade car face mechanic mercy"

  // The seed phrase private key
  final privateKey = keys.derivePrivateKey(seedPhrase);
  
  // Instantiate an Account object to sign and send transactions
  final account = Account(privateKey, "ws://your-websocket.com");
}
```

### Sign a Transaction
Generate a signed transaction

```dart
import 'dart:math';
import "package:nova/nova.dart";

void main() async {
  final nova = Nova(
    "0x4646464646464646464646464646464646464646464646464646464646464646",
    "ws://xyz.com",
  );

  final signedTransaction = await nova.account.sign(
    nonce: BigInt.from(9),
    to: "0x3535353535353535353535353535353535353535",
    gasLimit: BigInt.from(21000),
    gasPrice: BigInt.from(20 * pow(10, 9)),
    value: BigInt.from(pow(10, 18)),
    chainId: 1,
  );
}
```


### Send a Transaction

Sign and send a transaction.

```dart
import 'dart:math';
import "package:nova/nova.dart";

void main() async {
  final nova = Nova(
    "0x4646464646464646464646464646464646464646464646464646464646464646",
    "ws://xyz.com",
  );

  final signedTransaction = await nova.account.send(
    nonce: BigInt.from(9),
    to: "0x3535353535353535353535353535353535353535",
    gasLimit: BigInt.from(21000),
    gasPrice: BigInt.from(20 * pow(10, 9)),
    value: BigInt.from(pow(10, 18)),
    chainId: 1,
  );
}
```


## Ethereum Key Management

### Generate a Account
Generate a seed phrase

```dart
import "package:nova/nova.dart";

void main() {
  final seedPhrase = keys.generateMnemonic();
  print(seedPhrase);
  // imitate garbage talent chronic wonder tornado pluck 
  // pigeon gravity train jar laptop hurry poverty uncover 
  // intact oil expire peanut churn dutch cute burden pencil
}
```



## Communicate with an Ethereum Node with Json RPC
The library facilitates communication with an Ethereum node, such as Geth or Parity, using the JSON-RPC protocol. Currently only part of the specification is implemented.

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
