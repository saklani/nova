import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'access.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction extends Equatable {
  /// Legacy Transaction
  final String? from;
  final String? type;
  final int nonce;
  final String to;
  final BigInt value;
  final String input;
  final BigInt gasPrice;
  final BigInt gasLimit;
  final int chainId;

  // EIP 1559
  final BigInt? maxPriorityFeePerGas;
  final BigInt? maxFeePerGas;

  // EIP 1559 AND EIP 2930
  final List<Access>? accessList;

  Transaction({
    this.from,
    this.type,
    required this.nonce,
    required this.to,
    required this.gasLimit,
    required this.value,
    required this.input,
    required this.chainId,
    required this.gasPrice,
    this.maxPriorityFeePerGas,
    this.maxFeePerGas,
    this.accessList,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  Map<String, dynamic> to0xMap() => {
        'nonce': '0x${this.nonce.toRadixString(16)}',
        'to': this.to,
        'gasPrice': '0x${this.gasPrice.toRadixString(16)}',
        'gasLimit': '0x${this.gasLimit.toRadixString(16)}',
        'value': '0x${this.value.toRadixString(16)}',
        'input': this.input,
        'chainId': '0x${this.chainId.toRadixString(16)}',
      };

  @override
  List<Object?> get props => [
        from,
        type,
        nonce,
        to,
        gasLimit,
        value,
      ];
}
