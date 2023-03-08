import 'dart:typed_data';

import '../extensions.dart';

/// The canonical instance of [RLP].
const rlp_ = RLP._();

/// RLP Recursive Length Prefix
/// Read more: https://ethereum.org/en/developers/docs/data-structures-and-encoding/rlp/
class RLP {
  const RLP._();

  /// Encodes the input as a Uint8List
  Uint8List encode(dynamic input) {
    if (input is List) {
      final output = BytesBuilder();
      for (int i = 0; i < input.length; i++) {
        output.add(encode(input[i]));
      }
      return Uint8List.fromList(
        _encodeLength(output.length, 0xc0) + output.toBytes(),
      );
    }

    if (input is String) {
      return _maybeEncodeLength(input.toBytes());
    } else if (input == 0 || input == BigInt.zero) {
      return Uint8List.fromList([0x80]);
    } else if (input is int) {
      return _maybeEncodeLength(BigInt.from(input).toBytes());
    } else if (input is BigInt) {
      return _maybeEncodeLength(input.toBytes());
    } else {
      // Invalid Input Type
      throw TypeError();
    }
  }

  Uint8List _encodeLength(int len, int offset) {
    if (len < 56) {
      return Uint8List.fromList([len + offset]);
    } else {
      var binary = _toBinary(len);
      return Uint8List.fromList([binary.length + offset + 55] + binary);
    }
  }

  Uint8List _maybeEncodeLength(Uint8List input) {
    if (input.length == 1 && input.first < 0x80) {
      return input;
    } else {
      return Uint8List.fromList(_encodeLength(input.length, 0x80) + input);
    }
  }

  Uint8List _toBinary(int x) {
    if (x == 0) {
      return Uint8List(0);
    } else {
      return Uint8List.fromList(_toBinary(x ~/ 256) + [x % 256]);
    }
  }
}
