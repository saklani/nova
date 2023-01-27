import 'package:freezed_annotation/freezed_annotation.dart';

part 'signed_transaction.freezed.dart';
part 'signed_transaction.g.dart';

@freezed
class SignedTransaction with _$SignedTransaction {
  const SignedTransaction._();

  const factory SignedTransaction({
    required BigInt nonce,
    required String to,
    required BigInt value,
    required String input,
    required BigInt gasPrice,
    required BigInt gasLimit,
    required int v,
    required BigInt r,
    required BigInt s,
    required String messageHash,
    required String rawTransaction,
    required String transactionHash,
  }) = _SignedTransaction;

  factory SignedTransaction.fromJson(Map<String, dynamic> json) =>
      _$SignedTransactionFromJson(json);

  List<BigInt> get raw => [
        nonce,
        gasPrice,
        gasLimit,
        BigInt.parse(to),
        value,
        BigInt.parse(input.isEmpty ? '0' : input),
        BigInt.from(v),
        r,
        s,
      ];

  Map<String, String> serialize() {
    return {
      'messageHash': messageHash,
      'v': '0x${v.toRadixString(16)}',
      'r': '0x${r.toRadixString(16)}',
      's': '0x${s.toRadixString(16)}',
      'rawTransaction': rawTransaction,
      'transactionHash': transactionHash,
    };
  }
}
