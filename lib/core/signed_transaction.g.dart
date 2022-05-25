// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signed_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignedTransaction _$SignedTransactionFromJson(Map<String, dynamic> json) =>
    SignedTransaction(
      nonce: json['nonce'] as int,
      to: json['to'] as String,
      value: BigInt.parse(json['value'] as String),
      input: json['input'] as String,
      gasPrice: BigInt.parse(json['gasPrice'] as String),
      gasLimit: BigInt.parse(json['gasLimit'] as String),
      v: json['v'] as int,
      r: BigInt.parse(json['r'] as String),
      s: BigInt.parse(json['s'] as String),
      messageHash: json['messageHash'] as String,
      rawTransaction: json['rawTransaction'] as String,
      transactionHash: json['transactionHash'] as String,
    );

Map<String, dynamic> _$SignedTransactionToJson(SignedTransaction instance) =>
    <String, dynamic>{
      'nonce': instance.nonce,
      'to': instance.to,
      'value': instance.value.toString(),
      'input': instance.input,
      'gasPrice': instance.gasPrice.toString(),
      'gasLimit': instance.gasLimit.toString(),
      'v': instance.v,
      'r': instance.r.toString(),
      's': instance.s.toString(),
      'messageHash': instance.messageHash,
      'rawTransaction': instance.rawTransaction,
      'transactionHash': instance.transactionHash,
    };
