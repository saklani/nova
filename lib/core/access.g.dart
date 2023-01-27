// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Access _$$_AccessFromJson(Map<String, dynamic> json) => _$_Access(
      address: json['address'] as String,
      storageKey: (json['storageKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AccessToJson(_$_Access instance) => <String, dynamic>{
      'address': instance.address,
      'storageKey': instance.storageKey,
    };
