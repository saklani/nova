import 'dart:typed_data';

import 'package:nova/nova.dart';

/// [ContractDataType] represents Solidity data types;
abstract class ContractDataType<T> {
  const ContractDataType();
  
  T get decodedValue;
  String get encodedValue;
}

/// [Uint] represents Solidity uint<M> data type
class Uint extends ContractDataType<BigInt> {
  /// The actual value as bytes
  final Uint8List bytes;

  /// Length of the uint
  final int M;

  Uint(this.bytes, this.M)
      : assert(bytes.bigInt() >= BigInt.zero),
        assert(M % 8 == 0);

  @override
  BigInt get decodedValue => this.bytes.bigInt();

  @override
  String get encodedValue => this.bytes.hex();
}

/// [Int] represents Solidity int<M> data type
class Int extends ContractDataType<BigInt> {
  /// The actual value as bytes
  final Uint8List bytes;

  /// Length of the uint
  final int M;

  const Int(this.bytes, this.M) : assert(M % 8 == 0);

  @override
  BigInt get decodedValue => this.bytes.bigInt();

  @override
  String get encodedValue => this.bytes.hex();
}
