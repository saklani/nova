// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signed_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignedData _$SignedDataFromJson(Map<String, dynamic> json) {
  return _SignedData.fromJson(json);
}

/// @nodoc
mixin _$SignedData {
  String get hash => throw _privateConstructorUsedError;
  BigInt get r => throw _privateConstructorUsedError;
  BigInt get s => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignedDataCopyWith<SignedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignedDataCopyWith<$Res> {
  factory $SignedDataCopyWith(
          SignedData value, $Res Function(SignedData) then) =
      _$SignedDataCopyWithImpl<$Res, SignedData>;
  @useResult
  $Res call({String hash, BigInt r, BigInt s});
}

/// @nodoc
class _$SignedDataCopyWithImpl<$Res, $Val extends SignedData>
    implements $SignedDataCopyWith<$Res> {
  _$SignedDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? r = null,
    Object? s = null,
  }) {
    return _then(_value.copyWith(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      r: null == r
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as BigInt,
      s: null == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignedDataCopyWith<$Res>
    implements $SignedDataCopyWith<$Res> {
  factory _$$_SignedDataCopyWith(
          _$_SignedData value, $Res Function(_$_SignedData) then) =
      __$$_SignedDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hash, BigInt r, BigInt s});
}

/// @nodoc
class __$$_SignedDataCopyWithImpl<$Res>
    extends _$SignedDataCopyWithImpl<$Res, _$_SignedData>
    implements _$$_SignedDataCopyWith<$Res> {
  __$$_SignedDataCopyWithImpl(
      _$_SignedData _value, $Res Function(_$_SignedData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? r = null,
    Object? s = null,
  }) {
    return _then(_$_SignedData(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      r: null == r
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as BigInt,
      s: null == s
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignedData implements _SignedData {
  const _$_SignedData({required this.hash, required this.r, required this.s});

  factory _$_SignedData.fromJson(Map<String, dynamic> json) =>
      _$$_SignedDataFromJson(json);

  @override
  final String hash;
  @override
  final BigInt r;
  @override
  final BigInt s;

  @override
  String toString() {
    return 'SignedData(hash: $hash, r: $r, s: $s)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignedData &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.r, r) || other.r == r) &&
            (identical(other.s, s) || other.s == s));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hash, r, s);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignedDataCopyWith<_$_SignedData> get copyWith =>
      __$$_SignedDataCopyWithImpl<_$_SignedData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignedDataToJson(
      this,
    );
  }
}

abstract class _SignedData implements SignedData {
  const factory _SignedData(
      {required final String hash,
      required final BigInt r,
      required final BigInt s}) = _$_SignedData;

  factory _SignedData.fromJson(Map<String, dynamic> json) =
      _$_SignedData.fromJson;

  @override
  String get hash;
  @override
  BigInt get r;
  @override
  BigInt get s;
  @override
  @JsonKey(ignore: true)
  _$$_SignedDataCopyWith<_$_SignedData> get copyWith =>
      throw _privateConstructorUsedError;
}
