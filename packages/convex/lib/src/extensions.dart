import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart' as convert;

extension BigIntExtension on BigInt {
  /// Return [BigInt] as an even padded hex [String].
  String toHex({bool with0x = true}) {
    String result = toRadixString(16);
    int newLength = result.length + (result.length % 2 == 0 ? 0 : 1);
    result = result.padLeft(newLength, '0');
    return (with0x ? '0x' : '') + result;
  }

  /// Return [BigInt] as bytes (as a [Uint8List]).
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
}

extension StringExtension on String {
  /// Remove 0x from the hex
  String strip0x() => startsWith('0x') ? substring(2, length) : this;

  /// Is the string a valid hex
  bool isValidHex() => RegExp(r'^0x[a-fA-F0-9]+$').hasMatch(this);

  /// Is the string a valid binary
  bool isValidBinary() {
    for (int i = 0; i < length; i++) {
      if (this[i] != '0' && this[i] != '1') return false;
    }
    return true;
  }

  /// Returns the hex as BigInt
  BigInt toBigInt() {
    if (this == '0x') {
      return BigInt.zero;
    } else if (!isValidHex()) {
      throw Exception("not a valid hex");
    } else {
      return BigInt.parse("0x${strip0x()}");
    }
  }

  /// Converts the String to UTF8 and returns the Hex as Bytes
  Uint8List toBytes() {
    return Uint8List.fromList(utf8.encode(this));
  }

  String toHex() {
    String result = "0x";
    for (var i = 0; i < length; i++) {
      int code = codeUnitAt(i);
      String n = code.toRadixString(16);
      result += n.length < 2 ? '0$n' : n;
    }
    return result;
  }

  /// Returns the original String from the Hex
  String toUTF8() {
    List<int> result = [];
    String temp = strip0x();
    for (int i = 0; i <= length - 3; i += 2) {
      int code = "0x${temp.substring(i, i + 2)}".toInt();
      result.add(code);
    }
    return utf8.decode(result);
  }

  int toInt() {
    if (isEmpty) {
      return 0;
    } else if (!isValidHex()) {
      throw FormatException("not a valid hex");
    } else {
      return int.parse(strip0x(), radix: 16);
    }
  }
}

extension Uint8ListExtension on Uint8List {
  /// Return [Uint8List] to a hex [String]
  String toHex({bool with0x = true}) {
    return (with0x ? '0x' : '') + convert.hex.encode(this);
  }

  /// Return [Uint8List] to a UTF8 [String]
  String toUTF8({bool with0x = true}) {
    return utf8.decode(this);
  }

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
