// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Access _$AccessFromJson(Map<String, dynamic> json) => Access(
      address: json['address'] as String,
      storageKey: (json['storageKey'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AccessToJson(Access instance) => <String, dynamic>{
      'address': instance.address,
      'storageKey': instance.storageKey,
    };
