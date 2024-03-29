import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:convex/convex.dart';
import 'access.dart';

class Transaction {
  final String? from;
  final String? type;
  final BigInt nonce;
  final String to;
  final BigInt value;
  final String input;
  final BigInt gasPrice;
  final BigInt gasLimit;
  final int chainId;
  final BigInt? maxPriorityFeePerGas;
  final BigInt? maxFeePerGas;
  final List<Access>? accessList;

  Transaction({
    this.from,
    this.type,
    required this.nonce,
    required this.to,
    required this.value,
    this.input = '',
    required this.gasPrice,
    required this.gasLimit,
    this.chainId = 1,
    this.maxPriorityFeePerGas,
    this.maxFeePerGas,
    this.accessList,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        from: json['from'],
        type: json['type'],
        nonce: BigInt.parse(json['nonce'].toString()),
        to: json['to'],
        value: BigInt.parse(json['value'].toString()),
        input: json['input'],
        gasPrice: BigInt.parse(json['gasPrice'].toString()),
        gasLimit: BigInt.parse(json['gasLimit'].toString()),
        chainId: int.parse(json['chainId'].toString()),
        maxPriorityFeePerGas:
            BigInt.parse(json['maxPriorityFeePerGas'].toString()),
        maxFeePerGas: BigInt.parse(json['maxFeePerGas'].toString()),
        accessList: json['accessList'].map((e) => Access.fromJson(e)).toList(),
      );

  Map<String, dynamic> to0xMap() => {
        'nonce': this.nonce.toHex(),
        'to': this.to,
        'gasPrice': this.gasPrice.toHex(),
        'gasLimit': this.gasLimit.toHex(),
        'value': this.value.toHex(),
        'input': this.input,
        'chainId': BigInt.from(this.chainId).toHex(),
      };

  List<String> toList() {
    return [
      nonce.toHex(),
      gasPrice.toHex(),
      gasLimit.toHex(),
      "0x${to.strip0x()}",
      value.toHex(),
      input.toHex(),
      BigInt.from(chainId).toHex(),
      BigInt.zero.toHex(),
      BigInt.zero.toHex(),
    ];
  }

  List<BigInt> toBigInts() {
    return [
      nonce,
      gasPrice,
      gasLimit,
      "0x${to.strip0x()}".toBigInt(),
      value,
      input.toHex().toBigInt(),
      BigInt.from(chainId),
      BigInt.zero,
      BigInt.zero,
    ];
  }

  Uint8List toBytes() {
    List<String> data = toList();
    print(data);
    return Uint8List.fromList(data.map((e) => e.toBytes()).flattened.toList());
  }

  @override
  String toString() {
    final content = [
      "nonce: $nonce",
      "to: $to",
      "value: $value",
      "input: $input",
      "gasPrice: $gasPrice",
      "gasLimit: $gasLimit",
      "chainId: $chainId",
      "maxPriorityFeePerGas: $maxPriorityFeePerGas",
      "maxFeePerGas: $maxFeePerGas",
      "accessList: ${accessList}",
    ].join(', ');
    return '$runtimeType($content)';
  }

  @override
  bool operator ==(Object other) {
    return runtimeType == other.runtimeType &&
        other is Transaction &&
        other.nonce == nonce &&
        other.to == to &&
        other.value == value &&
        other.input == input &&
        other.gasPrice == gasPrice &&
        other.gasLimit == gasLimit &&
        other.chainId == chainId &&
        other.maxPriorityFeePerGas == maxPriorityFeePerGas &&
        other.maxFeePerGas == maxFeePerGas &&
        IterableEquality().equals(other.accessList, accessList);
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        nonce,
        to,
        value,
        input,
        gasPrice,
        gasLimit,
        chainId,
        maxPriorityFeePerGas,
        maxFeePerGas,
        accessList,
      );
}
