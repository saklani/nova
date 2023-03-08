import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';

extension Uint8ListExtension on Uint8List {
  /// Return [Uint8List] to a hex [String]
  String toHex({bool with0x = true}) => (with0x ? '0x' : '') + hex.encode(this);

  /// Return [Uint8List] to a UTF8 [String]
  String toUTF8({bool with0x = true}) => utf8.decode(this);

  /// Return [Uint8List] the as a [BigInt]
  BigInt toBigInt({int sign = 1}) {
    if (sign == 0) {
      return BigInt.zero;
    }

    BigInt result;

    if (length == 1) {
      result = BigInt.from(this[0]);
    } else {
      result = BigInt.from(0);
      for (var i = 0; i < length; i++) {
        var item = this[length - i - 1];
        result |= (BigInt.from(item) << (8 * i));
      }
    }

    if (result != BigInt.zero) {
      if (sign < 0) {
        result = result.toSigned(result.bitLength);
      } else {
        result = result.toUnsigned(result.bitLength);
      }
    }
    return result;
  }

  /// Returns a binary representation of the bytes array (as a string).
  String toBinary() =>
      map((byte) => byte.toRadixString(2).padLeft(8, '0')).join('');
}
