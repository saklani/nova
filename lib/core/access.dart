
import 'package:json_annotation/json_annotation.dart';

part 'access.g.dart';

@JsonSerializable()
class Access {
  final String address;
  final List<String> storageKey;

  Access({
    required this.address,
    required this.storageKey,
  });

  factory Access.fromJson(Map<String, dynamic> json) => _$AccessFromJson(json);

  /// Connect the generated [_$AccessToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AccessToJson(this);
}
