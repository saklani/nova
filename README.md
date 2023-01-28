# Nova
Nova can be used to generate eth wallets, sign transaction, and send them. 
It also implements part of the Ethereum JSON-RPC API specification.

## Wallet 
The library has built-in support for managing ethereum private keys, and signatures. 
It provides functionality for generating, signing, and sending transactions. 

### Generate a wallet
Generate a new wallet with a seed phrase

```dart
import "package:nova/nova.dart";

void main() {
  // Generate a seed phrase
  final seedPhrase = generateMnemonic();

  // Derive a private key from the seed phrase
  final privateKey = derivePrivateKey(seedPhrase);
  
  // Instantiate a wallet object to sign and send transactions
  final wallet = Wallet(privateKey, "ws://your-websocket.com");
}
```

### Use your own seed phrase or private key
Load a wallet with a seed phrase

```dart
import "package:nova/nova.dart";

void main() {
  // Your seed phrase
  final seedPhrase = "seed sock milk update focus rotate barely fade car face mechanic mercy"

  // The seed phrase private key
  final privateKey = derivePrivateKey(seedPhrase);

  final wallet = Wallet(privateKey, "ws://your-websocket.com");
}
```

### Sign a Transaction
Generate a signed transaction

```dart
import 'dart:math';
import "package:nova/nova.dart";

void main() async {
  final wallet = Wallet(
  "0x4646464646464646464646464646464646464646464646464646464646464646",
  "ws://xyz.com",
  );

  final signedTransaction = await wallet.sign(
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

Quickly sign and send a transaction.

```dart
import 'dart:math';
import "package:nova/nova.dart";

void main() async {
   final wallet = Wallet(
  "0x4646464646464646464646464646464646464646464646464646464646464646",
  "ws://xyz.com",
  );

  final signedTransaction = await wallet.send(
    nonce: BigInt.from(9),
    to: "0x3535353535353535353535353535353535353535",
    gasLimit: BigInt.from(21000),
    gasPrice: BigInt.from(20 * pow(10, 9)),
    value: BigInt.from(pow(10, 18)),
    chainId: 1,
  );
}
```



## Extensions
Convenient dart extensions to make life easier


### Quickly convert between different types
```dart
import "package:nova/nova.dart";

void main() {
    final privateKey = "0x4646464646464646464646464646464646464646464646464646464646464646";
    print(privateKey.bigInt());
    // 31786063712204445802548897845522170783250584025862115618674630904133015979590
    print(privateKey.bytes());
    // [52, 54, 52, 54, 52, 54, ..., 54]

    final privateKeyBigInt = BigInt.from(42);
    print(privateKey.bytes());
    // [16, 146]

    final privateKeyBytes = Uint8List.fromList([16, 146]);
    print(privateKey.bigInt());
    // 4242
}
```

### Validate a hex string 
```dart
import "package:nova/nova.dart";

void main() {
    final privateKeyA = "0x4646464646464646464646464646464646464646464646464646464646464646";
    print(privateKeyA.isValidHex());
    // true

   final privateKeyB = "902MIsam)pp";
    print(privateKeyB.isValidHex());
    // true
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
