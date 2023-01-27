import 'package:freezed_annotation/freezed_annotation.dart';

import 'access.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  /// Legacy Transaction

  const Transaction._();

  const factory Transaction({
    String? from,
    String? type,
    required BigInt nonce,
    required String to,
    required BigInt value,
    @Default('') String input,
    required BigInt gasPrice,
    required BigInt gasLimit,
    @Default(1) int chainId,

    // EIP 1559
    BigInt? maxPriorityFeePerGas,
    BigInt? maxFeePerGas,

    // EIP 1559 AND EIP 2930
    List<Access>? accessList,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> to0xMap() => {
        'nonce': '0x${this.nonce.toRadixString(16)}',
        'to': this.to,
        'gasPrice': '0x${this.gasPrice.toRadixString(16)}',
        'gasLimit': '0x${this.gasLimit.toRadixString(16)}',
        'value': '0x${this.value.toRadixString(16)}',
        'input': this.input,
        'chainId': '0x${this.chainId.toRadixString(16)}',
      };
}
