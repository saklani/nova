import "dart:typed_data";

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