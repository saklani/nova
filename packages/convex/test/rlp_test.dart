import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:convex/convex.dart';
import 'package:convex/src/rlp.dart';
import 'package:test/test.dart';

dynamic castTestValue(dynamic testValue) {
  if (testValue is String && testValue.startsWith('#')) {
    var bn = BigInt.parse(testValue.substring(1));
    return bn;
  } else {
    return testValue;
  }
}

void main() {
  test('The string dog', () {
    final encoded = rlp.encode('dog');
    expect(encoded.length, 4);
    expect(
      encoded,
      Uint8List.fromList([0x83, ...'dog'.codeUnits]),
    );
  });

  test('The list cat, dog', () {
    final encoded = rlp.encode(['cat', 'dog']);

    expect(
      encoded,
      [
        ...[0xc8, 0x83],
        ...'cat'.codeUnits,
        ...[0x83],
        ...'dog'.codeUnits
      ],
    );
  });

  test('The empty string', () {
    final encoded = rlp.encode('');
    expect(encoded, Uint8List.fromList([0x80]));
  });

  test('The empty list', () {
    final encoded = rlp.encode([]);
    expect(encoded, Uint8List.fromList([0xc0]));
  });

  test('The integer 0', () {
    final encoded = rlp.encode(0);
    expect(encoded, Uint8List.fromList([0x80]));
  });

  test('The integer 1', () {
    final encoded = rlp.encode(1);
    expect(encoded, Uint8List.fromList([0x01]));
  });

  test('BigInt.zero', () {
    final encoded = rlp.encode(BigInt.zero);
    expect(encoded, Uint8List.fromList([0x80]));
  });

  test('BigInt.one', () {
    final encoded = rlp.encode(BigInt.one);
    expect(encoded, Uint8List.fromList([0x01]));
  });

  test('The encoded integer 0', () {
    final encoded = rlp.encode('\x00');
    expect(encoded, Uint8List.fromList([0x00]));
  });

  test('The encoded integer 15', () {
    final encoded = rlp.encode('\x0f');
    expect(encoded, Uint8List.fromList([0x0f]));
  });

  test('The encoded integer 1024', () {
    final encoded = rlp.encode('\x04\x00');
    expect(encoded, Uint8List.fromList([0x82, 0x04, 0x00]));
  });

  test('The set theoretical representation of three', () {
    final encoded = rlp.encode([
      [],
      [[]],
      [
        [],
        [[]]
      ]
    ]);
    expect(encoded, [0xc7, 0xc0, 0xc1, 0xc0, 0xc3, 0xc0, 0xc1, 0xc0]);
  });

  // Check behaviour against the js version of rlp
  test('The string a', () {
    final encoded = rlp.encode('a');
    expect(String.fromCharCodes(encoded), 'a');
  });

  test(
      'length of string >55 should return 0xb7+len(len(data)) plus len(data) plus data',
      () {
    final encoded = rlp.encode(
      'zoo255zoo255zzzzzzzzzzzzssssssssssssssssssssssssssssssssssssssssssssss',
    );
    expect(encoded.length, 72);
    expect(encoded[0], 184);
    expect(encoded[1], 70);
    expect(encoded[2], 122);
    expect(encoded[3], 111);
    expect(encoded[12], 53);
  });

  // Check behaviour against the js version of rlp
  test('length of list 0-55 should return (0xc0+len(data)) plus data', () {
    final encoded = rlp.encode(['dog', 'god', 'cat']);
    expect(encoded.length, 13);
    expect(encoded[0], 204);
    expect(encoded[1], 131);
    expect(encoded[11], 97);
    expect(encoded[12], 116);
  });

  // Check behaviour against the js version of rlp
  test('should not crash on an invalid rlp', () {
    rlp.encode(
      String.fromCharCodes([
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        239,
        191,
        189,
        29,
        239,
        191,
        189,
        77,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        93,
        122,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        103,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        26,
        239,
        191,
        189,
        18,
        69,
        27,
        239,
        191,
        189,
        239,
        191,
        189,
        116,
        19,
        239,
        191,
        189,
        239,
        191,
        189,
        66,
        239,
        191,
        189,
        64,
        212,
        147,
        71,
        239,
        191,
        189,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        239,
        191,
        189,
        11,
        222,
        155,
        122,
        54,
        42,
        194,
        169,
        239,
        191,
        189,
        70,
        239,
        191,
        189,
        72,
        239,
        191,
        189,
        239,
        191,
        189,
        54,
        53,
        239,
        191,
        189,
        100,
        73,
        239,
        191,
        189,
        55,
        239,
        191,
        189,
        239,
        191,
        189,
        59,
        1,
        239,
        191,
        189,
        109,
        239,
        191,
        189,
        239,
        191,
        189,
        93,
        239,
        191,
        189,
        208,
        128,
        239,
        191,
        189,
        239,
        191,
        189,
        0,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        15,
        66,
        64,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        4,
        239,
        191,
        189,
        79,
        103,
        239,
        191,
        189,
        85,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        74,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        54,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        83,
        239,
        191,
        189,
        14,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        4,
        63,
        239,
        191,
        189,
        63,
        239,
        191,
        189,
        41,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        67,
        28,
        239,
        191,
        189,
        239,
        191,
        189,
        11,
        239,
        191,
        189,
        31,
        239,
        191,
        189,
        239,
        191,
        189,
        104,
        96,
        100,
        239,
        191,
        189,
        239,
        191,
        189,
        12,
        239,
        191,
        189,
        239,
        191,
        189,
        206,
        152,
        239,
        191,
        189,
        239,
        191,
        189,
        31,
        112,
        111,
        239,
        191,
        189,
        239,
        191,
        189,
        65,
        239,
        191,
        189,
        41,
        239,
        191,
        189,
        239,
        191,
        189,
        53,
        84,
        11,
        239,
        191,
        189,
        239,
        191,
        189,
        12,
        102,
        24,
        12,
        42,
        105,
        109,
        239,
        191,
        189,
        58,
        239,
        191,
        189,
        4,
        239,
        191,
        189,
        104,
        82,
        9,
        239,
        191,
        189,
        6,
        66,
        91,
        43,
        38,
        102,
        117,
        239,
        191,
        189,
        105,
        239,
        191,
        189,
        239,
        191,
        189,
        239,
        191,
        189,
        89,
        127,
        239,
        191,
        189,
        114
      ]),
    );
  });

  var jsonString = File('test/rlp.json').readAsStringSync();
  Map tests = jsonDecode(jsonString);

  for (MapEntry entry in tests.entries) {
    String key = entry.key;
    Map value = entry.value;
    dynamic testValue = value['in'];
    String expected = value['out'];

    test('Official test: $key', () {
      final encoded = rlp.encode(castTestValue(testValue));
      final outpuut = encoded.toHex(with0x: false);
      expect(outpuut, expected);
    });
  }
}
