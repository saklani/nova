import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signed_transaction.g.dart';

@JsonSerializable()
class SignedTransaction extends Equatable {
  final int nonce;
  final String to;
  final BigInt value;
  final String input;
  final BigInt gasPrice;
  final BigInt gasLimit;
  final int v;
  final BigInt r;
  final BigInt s;
  final String messageHash;
  final String rawTransaction;
  final String transactionHash;

  const SignedTransaction({
    required this.nonce,
    required this.to,
    required this.value,
    required this.input,
    required this.gasPrice,
    required this.gasLimit,
    required this.v,
    required this.r,
    required this.s,
    required this.messageHash,
    required this.rawTransaction,
    required this.transactionHash,
  });

  List<BigInt> get raw => [
        BigInt.from(nonce),
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

  @override
  List<Object?> get props => [
        messageHash,
        r,
        s,
        v,
        rawTransaction,
        transactionHash,
      ];
}
