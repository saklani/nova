import 'dart:typed_data';

import 'package:convert/convert.dart' as convert;

extension StringExtension on String {
  String strip0x() {
    // Remove 0x from the hex
    return startsWith('0x') ? substring(2, length) : this;
  }

  bool validHex() {
    // Is the string a valid hex 
    return RegExp(r'^[a-fA-F0-9]+$').hasMatch(strip0x());
  }

  BigInt bigInt() {
    // Returns the hex as BigInt
    if (!validHex()) throw Exception("not a valid hex");
    return BigInt.parse("0x${strip0x()}");
  }

  Uint8List bytes() {
    // Returns the hex as Bytes
    if (!validHex()) throw Exception("not a valid hex");
    return Uint8List.fromList(strip0x().codeUnits);
  }
}

extension Uint8ListExtension on Uint8List {
  String hex({bool with0x = true}) {
    // Return Uint8List to a hex string
    return (with0x ? '0x' : '') + convert.hex.encode(this);
  }

  BigInt bigInt({int sign = 1}) {
    // Return Uint8List the as a BigInt
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

  String hex({bool with0x = true}) {
    // Return BigInt as a hex
    return (with0x ? '0x' : '') + toRadixString(16);
  }

  Uint8List bytes() {
    // Return BigInt as Bytes
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
