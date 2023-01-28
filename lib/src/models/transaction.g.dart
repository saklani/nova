// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      from: json['from'] as String?,
      type: json['type'] as String?,
      nonce: BigInt.parse(json['nonce'] as String),
      to: json['to'] as String,
      value: BigInt.parse(json['value'] as String),
      input: json['input'] as String? ?? '',
      gasPrice: BigInt.parse(json['gasPrice'] as String),
      gasLimit: BigInt.parse(json['gasLimit'] as String),
      chainId: json['chainId'] as int? ?? 1,
      maxPriorityFeePerGas: json['maxPriorityFeePerGas'] == null
          ? null
          : BigInt.parse(json['maxPriorityFeePerGas'] as String),
      maxFeePerGas: json['maxFeePerGas'] == null
          ? null
          : BigInt.parse(json['maxFeePerGas'] as String),
      accessList: (json['accessList'] as List<dynamic>?)
          ?.map((e) => Access.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'from': instance.from,
      'type': instance.type,
      'nonce': instance.nonce.toString(),
      'to': instance.to,
      'value': instance.value.toString(),
      'input': instance.input,
      'gasPrice': instance.gasPrice.toString(),
      'gasLimit': instance.gasLimit.toString(),
      'chainId': instance.chainId,
      'maxPriorityFeePerGas': instance.maxPriorityFeePerGas?.toString(),
      'maxFeePerGas': instance.maxFeePerGas?.toString(),
      'accessList': instance.accessList,
    };
