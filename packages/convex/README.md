# Convex
Ethereum utilities written in Dart.

This library has the following goals:
1. Keep dependencies to a minimum.
2. Written in [Effective Dart style](https://dart.dev/guides/language/effective-dart).


## Cryptographic utilities
### Get the keccak of any data
Get the keccak of any bytes data
```dart
import "package:convex/convex.dart";

void main() {
    final data = "your-data";
    print(algorithm.keccak(data.toBytes()));    
    print(algorithm.keccak(data.toBytes(), bits: 128));  
}
```

### Sign arbitary data
Sign any string data with a private key
```dart
import "package:convex/convex.dart";

void main() {
  final privateKey = "0x4646464646464646464646464646464646464646464646464646464646464646";
  final data = "your-data";
  ethereum.sign(privateKey, data);
}
```


## Type conversions

### Quickly convert between different types
```dart
import "package:convex/convex.dart";

void main() {
    final privateKey = "0x4646464646464646464646464646464646464646464646464646464646464646";
    print(privateKey.toBigInt());
    // 31786063712204445802548897845522170783250584025862115618674630904133015979590
    print(privateKey.toBytes());
    // [52, 54, 52, 54, 52, 54, ..., 54]

    final privateKeyBigInt = BigInt.from(42);
    print(privateKeyBigInt.toBytes());
    // [16, 146]

    final privateKeyBytes = Uint8List.fromList([16, 146]);
    print(privateKeyBytes.toBigInt());
    // 4242
}
```

### Validate a hex string 
```dart
import "package:convex/convex.dart";

void main() {
    final privateKeyA = "0x4646464646464646464646464646464646464646464646464646464646464646";
    print(privateKeyA.isValidHex());
    // true

   final privateKeyB = "902MIsam)pp";
    print(privateKeyB.isValidHex());
    // false
}
```
