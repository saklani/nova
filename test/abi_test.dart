import 'dart:typed_data';

import 'package:nova/src/abi/abi_impl.dart';
import 'package:test/test.dart';

void main() {
  final staticTypeVariableData = [
    {"type": "address", "name": "a"},
    {"type": "address", "name": ""},
    {"type": "bool", "name": "b"},
    {"type": "bool", "name": ""},
    {"type": "uint8", "name": ""},
    {"type": "uint256", "name": "c"},
    {"type": "uint8", "name": ""},
    {"type": "uint256", "name": "d"},
    {"type": "int8", "name": ""},
    {"type": "int256", "name": ""},
    {"type": "bytes0", "name": "b"},
    {"type": "bytes32", "name": ""},
    {"type": "function", "name": ""},
  ];
  Map<String, Type> solTypeToDartType = {
    'address': Uint8List,
    'uint': BigInt,
    'int': BigInt,
    'bytes': Uint8List,
    'function': Uint8List,
    'bool': bool,
  };
  group('decode', () {
    test('contracts', () {});

    test('errors', () {});
    test('events', () {});

    test('functions', () {});

    group('data types', () {
      test('static types', () {
        for (int i = 0; i < staticTypeVariableData.length; i++) {
          final variable = ABIImpl.decodeVariable(staticTypeVariableData[i]);
          expect(
            variable.name,
            staticTypeVariableData[i]["name"],
          );
          expect(
            variable.type,
            ABIImpl.decodeDartTypeFromSolType(
                staticTypeVariableData[i]["type"]!),
          );
        }
      });

      test('dynamic types', () {
        for (int i = 0; i < staticTypeVariableData.length; i++) {
          final variable = ABIImpl.decodeVariable(staticTypeVariableData[i]);
          expect(
            variable.name,
            staticTypeVariableData[i]["name"],
          );
          expect(
            variable.type,
            ABIImpl.decodeDartTypeFromSolType(
                staticTypeVariableData[i]["type"]!),
          );
        }
      });
    });
  });
  group('encode', () {});
}
