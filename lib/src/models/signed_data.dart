import 'package:freezed_annotation/freezed_annotation.dart';

part 'signed_data.freezed.dart';
part 'signed_data.g.dart';

@freezed
class SignedData with _$SignedData {
  const factory SignedData({
    required String hash,
    required BigInt r,
    required BigInt s,
  }) = _SignedData;

  factory SignedData.fromJson(Map<String, dynamic> json) =>
      _$SignedDataFromJson(json);
}
