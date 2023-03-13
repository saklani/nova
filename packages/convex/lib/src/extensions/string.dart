import 'dart:convert';
import 'dart:typed_data';

import '../cryptography/rlp.dart';

extension StringExtension on String {
  bool isAddress() {
    final regex = RegExp(r'/^0x[a-fA-F0-9]{40}$/');
    return regex.hasMatch(this);
  }

  /// Is the [String] a valid binary
  bool isValidBinary() {
    for (int i = 0; i < length; i++) {
      if (this[i] != '0' && this[i] != '1') return false;
    }
    return true;
  }

  /// Is the [String] a valid hexadecimal
  bool isValidHex() => RegExp(r'^0x[a-fA-F0-9]+$').hasMatch(this);

  /// Remove '0x' from a hexadecimal
  String strip0x() => startsWith('0x') ? substring(2, length) : this;

  /// Returns the hexadecimal as [BigInt]
  BigInt toBigInt() {
    if (this == '0x') {
      return BigInt.zero;
    } else if (!isValidHex()) {
      throw Exception("not a valid hex");
    } else {
      return BigInt.parse("0x${strip0x()}");
    }
  }

  /// Converts the [String] to UTF8 and returns the hexadecimal as a [Uint8List]
  Uint8List toBytes() => Uint8List.fromList(utf8.encode(this));

  String toHex() {
    String result = "0x";
    for (var i = 0; i < length; i++) {
      int code = codeUnitAt(i);
      String n = code.toRadixString(16);
      result += n.length < 2 ? '0$n' : n;
    }
    return result;
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

  /// Converts the [String] to RLP returned as a [Uint8List]
  Uint8List toRLP() => rlp.encode(this);

  /// Returns the original [String] from the hexadecimal representation
  String toUTF8() {
    List<int> result = [];
    String temp = strip0x();
    for (int i = 0; i <= length - 3; i += 2) {
      int code = "0x${temp.substring(i, i + 2)}".toInt();
      result.add(code);
    }
    return utf8.decode(result);
  }
}
