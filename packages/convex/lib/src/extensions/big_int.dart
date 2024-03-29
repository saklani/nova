import 'dart:typed_data';

import '../cryptography/rlp.dart';

extension BigIntExtension on BigInt {
  /// Return [BigInt] as a [Uint8List]
  Uint8List toBytes() {
    if (this == BigInt.zero) {
      return Uint8List.fromList([0]);
    }
    BigInt byteMask = BigInt.from(0xff);
    BigInt number = this;
    int size = bitLength + (isNegative ? 8 : 7) >> 3;
    Uint8List result = Uint8List(size);
    for (var i = 0; i < size; i++) {
      result[size - i - 1] = (number & byteMask).toInt();
      number = number >> 8;
    }
    return result;
  }

  /// Return [BigInt] as an even padded hexadecimal [String].
  String toHex({bool with0x = true}) {
    String result = toRadixString(16);
    int newLength = result.length + (result.length % 2 == 0 ? 0 : 1);
    result = result.padLeft(newLength, '0');
    return (with0x ? '0x' : '') + result;
  }

  /// Converts the [BigInt] to RLP
  Uint8List toRLP() => rlp.encode(this);
}
