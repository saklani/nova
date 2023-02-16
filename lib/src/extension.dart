
import 'dart:typed_data';

import 'package:convert/convert.dart' as convert;

extension StringExtension on String {
  /// Remove 0x from the hex
  String strip0x() {
    return startsWith('0x') ? substring(2, length) : this;
  }

  /// Is the string a valid hex
  bool validHex() {
    return RegExp(r'^[a-fA-F0-9]+$').hasMatch(strip0x());
  }

  /// Returns the hex as BigInt
  BigInt bigInt() {
    if (!validHex()) throw Exception("not a valid hex");
    return BigInt.parse("0x${strip0x()}");
  }

  /// Returns the hex as Bytes
  Uint8List bytes() {
    if (!validHex()) throw Exception("not a valid hex");
    return Uint8List.fromList(strip0x().codeUnits);
  }

  List<BigInt> bigBytes() {
    if (!validHex()) throw Exception("not a valid hex");
    return strip0x().codeUnits.map((e) => BigInt.from(e)).toList();
  }
}

extension Uint8ListExtension on Uint8List {
  /// Return Uint8List to a hex string
  String hex({bool with0x = true}) {
    return (with0x ? '0x' : '') + convert.hex.encode(this);
  }

  /// Return Uint8List the as a BigInt
  BigInt bigInt({int sign = 1}) {
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
}

extension BigIntExtension on BigInt {
  /// Return BigInt as a hex String
  String hex({bool with0x = true}) {
    return (with0x ? '0x' : '') + toRadixString(16);
  }

  /// Return BigInt as Bytes
  Uint8List bytes() {
    BigInt _byteMask = BigInt.from(0xff);
    if (this == BigInt.zero) {
      return Uint8List.fromList([0]);
    }
    BigInt number = this;
    int size = bitLength + (isNegative ? 8 : 7) >> 3;
    Uint8List result = Uint8List(size);
    for (var i = 0; i < size; i++) {
      result[size - i - 1] = (number & _byteMask).toInt();
      number = number >> 8;
    }
    return result;
  }
}

extension IntExtension on int {
  /// Return Int as a hex String
  String hex({bool with0x = true}) {
    return (with0x ? '0x' : '') + toRadixString(16);
  }
}
