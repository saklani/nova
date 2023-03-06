# Nova

<div>
  <p>
  <a href="https://github.com/saklani/nova/actions"><img src="https://github.com/saklani/nova/actions/workflows/dart.yml/badge.svg" alt="Build Status"> </a>
  </p>
</div>



Nova can be used to generate eth wallets, sign transaction, and send them. 
It also implements some cryptographic functions, convenient types conversion extensions, and  part of the Ethereum JSON-RPC API specification.

## Account 
The library has built-in support for managing ethereum private keys, and signatures. 
It provides functionality for generating, signing, and sending transactions. 

### Generate a Account
Generate a new account with a seed phrase

```dart
import "package:nova/nova.dart";

void main() {
  // Generate a seed phrase
  final seedPhrase = Cryptography.generateMnemonic();

  // Derive a private key from the seed phrase
  final privateKey = Cryptography.derivePrivateKey(seedPhrase);
  
  // Instantiate an Account object to sign and send transactions
  final account = Account(privateKey, "ws://your-websocket.com");
}
```

### Use your own seed phrase or private key
Load an Account with a seed phrase

```dart
import "package:nova/nova.dart";

void main() {
  // Your seed phrase
  final seedPhrase = "seed sock milk update focus rotate barely fade car face mechanic mercy"

  // The seed phrase private key
  final privateKey = Cryptography.derivePrivateKey(seedPhrase);
  
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
  final account = Account(
    "0x4646464646464646464646464646464646464646464646464646464646464646",
    "ws://xyz.com",
  );

  final signedTransaction = await account.sign(
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
   final account = Account(
    "0x4646464646464646464646464646464646464646464646464646464646464646",
    "ws://xyz.com",
  );

  final signedTransaction = await account.send(
    nonce: BigInt.from(9),
    to: "0x3535353535353535353535353535353535353535",
    gasLimit: BigInt.from(21000),
    gasPrice: BigInt.from(20 * pow(10, 9)),
    value: BigInt.from(pow(10, 18)),
    chainId: 1,
  );
}
```

## Cryptography
Convenient wrapper around [pointycastle](https://pub.dev/packages/pointycastle) to make it easier to use.

### Get the keccak256 of any data
Get the keccak256 of any bytes data

```dart
import "package:nova/nova.dart";

void main() {
  final data = "your-data";
  Cryptography.keccak(data.bytes());
}
```

### Sign any data
Sign any string data with a private key
```dart
import "package:nova/nova.dart";

void main() {
  final privateKey = "0x4646464646464646464646464646464646464646464646464646464646464646";
  final data = "your-data";
  Cryptography.sign(privateKey, data);
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
