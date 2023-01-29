import 'package:freezed_annotation/freezed_annotation.dart';

import '../extension.dart';
import 'access.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  /// Legacy
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
        'nonce': this.nonce.hex(),
        'to': this.to,
        'gasPrice': this.gasPrice.hex(),
        'gasLimit': this.gasLimit.hex(),
        'value': this.value.hex(),
        'input': this.input,
        'chainId': this.chainId.hex(),
      };

  List<BigInt> toList() {
    return [
      nonce,
      gasPrice,
      gasLimit,
      to.bigInt(),
      value,
      input.isEmpty ? BigInt.zero : input.bigInt(),
      BigInt.from(chainId),
      BigInt.zero,
      BigInt.zero,
    ];
  }
}
