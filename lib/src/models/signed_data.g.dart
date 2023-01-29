// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signed_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignedData _$$_SignedDataFromJson(Map<String, dynamic> json) =>
    _$_SignedData(
      hash: json['hash'] as String,
      r: BigInt.parse(json['r'] as String),
      s: BigInt.parse(json['s'] as String),
    );

Map<String, dynamic> _$$_SignedDataToJson(_$_SignedData instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'r': instance.r.toString(),
      's': instance.s.toString(),
    };
