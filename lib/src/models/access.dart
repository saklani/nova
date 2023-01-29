import 'package:freezed_annotation/freezed_annotation.dart';

part 'access.freezed.dart';
part 'access.g.dart';

@freezed
class Access with _$Access {
  const factory Access({
    required String address,
    required List<String> storageKey,
  }) = _Access;

  factory Access.fromJson(Map<String, dynamic> json) => _$AccessFromJson(json);
}
