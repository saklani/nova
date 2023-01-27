// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String? get from => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  BigInt get nonce => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  BigInt get value => throw _privateConstructorUsedError;
  String get input => throw _privateConstructorUsedError;
  BigInt get gasPrice => throw _privateConstructorUsedError;
  BigInt get gasLimit => throw _privateConstructorUsedError;
  int get chainId => throw _privateConstructorUsedError; // EIP 1559
  BigInt? get maxPriorityFeePerGas => throw _privateConstructorUsedError;
  BigInt? get maxFeePerGas =>
      throw _privateConstructorUsedError; // EIP 1559 AND EIP 2930
  List<Access>? get accessList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String? from,
      String? type,
      BigInt nonce,
      String to,
      BigInt value,
      String input,
      BigInt gasPrice,
      BigInt gasLimit,
      int chainId,
      BigInt? maxPriorityFeePerGas,
      BigInt? maxFeePerGas,
      List<Access>? accessList});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? type = freezed,
    Object? nonce = null,
    Object? to = null,
    Object? value = null,
    Object? input = null,
    Object? gasPrice = null,
    Object? gasLimit = null,
    Object? chainId = null,
    Object? maxPriorityFeePerGas = freezed,
    Object? maxFeePerGas = freezed,
    Object? accessList = freezed,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      nonce: null == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as BigInt,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as BigInt,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      gasPrice: null == gasPrice
          ? _value.gasPrice
          : gasPrice // ignore: cast_nullable_to_non_nullable
              as BigInt,
      gasLimit: null == gasLimit
          ? _value.gasLimit
          : gasLimit // ignore: cast_nullable_to_non_nullable
              as BigInt,
      chainId: null == chainId
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int,
      maxPriorityFeePerGas: freezed == maxPriorityFeePerGas
          ? _value.maxPriorityFeePerGas
          : maxPriorityFeePerGas // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      maxFeePerGas: freezed == maxFeePerGas
          ? _value.maxFeePerGas
          : maxFeePerGas // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      accessList: freezed == accessList
          ? _value.accessList
          : accessList // ignore: cast_nullable_to_non_nullable
              as List<Access>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$_TransactionCopyWith(
          _$_Transaction value, $Res Function(_$_Transaction) then) =
      __$$_TransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? from,
      String? type,
      BigInt nonce,
      String to,
      BigInt value,
      String input,
      BigInt gasPrice,
      BigInt gasLimit,
      int chainId,
      BigInt? maxPriorityFeePerGas,
      BigInt? maxFeePerGas,
      List<Access>? accessList});
}

/// @nodoc
class __$$_TransactionCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$_Transaction>
    implements _$$_TransactionCopyWith<$Res> {
  __$$_TransactionCopyWithImpl(
      _$_Transaction _value, $Res Function(_$_Transaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? type = freezed,
    Object? nonce = null,
    Object? to = null,
    Object? value = null,
    Object? input = null,
    Object? gasPrice = null,
    Object? gasLimit = null,
    Object? chainId = null,
    Object? maxPriorityFeePerGas = freezed,
    Object? maxFeePerGas = freezed,
    Object? accessList = freezed,
  }) {
    return _then(_$_Transaction(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      nonce: null == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as BigInt,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as BigInt,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      gasPrice: null == gasPrice
          ? _value.gasPrice
          : gasPrice // ignore: cast_nullable_to_non_nullable
              as BigInt,
      gasLimit: null == gasLimit
          ? _value.gasLimit
          : gasLimit // ignore: cast_nullable_to_non_nullable
              as BigInt,
      chainId: null == chainId
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int,
      maxPriorityFeePerGas: freezed == maxPriorityFeePerGas
          ? _value.maxPriorityFeePerGas
          : maxPriorityFeePerGas // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      maxFeePerGas: freezed == maxFeePerGas
          ? _value.maxFeePerGas
          : maxFeePerGas // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      accessList: freezed == accessList
          ? _value._accessList
          : accessList // ignore: cast_nullable_to_non_nullable
              as List<Access>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Transaction extends _Transaction {
  const _$_Transaction(
      {this.from,
      this.type,
      required this.nonce,
      required this.to,
      required this.value,
      this.input = '',
      required this.gasPrice,
      required this.gasLimit,
      this.chainId = 1,
      this.maxPriorityFeePerGas,
      this.maxFeePerGas,
      final List<Access>? accessList})
      : _accessList = accessList,
        super._();

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFromJson(json);

  @override
  final String? from;
  @override
  final String? type;
  @override
  final BigInt nonce;
  @override
  final String to;
  @override
  final BigInt value;
  @override
  @JsonKey()
  final String input;
  @override
  final BigInt gasPrice;
  @override
  final BigInt gasLimit;
  @override
  @JsonKey()
  final int chainId;
// EIP 1559
  @override
  final BigInt? maxPriorityFeePerGas;
  @override
  final BigInt? maxFeePerGas;
// EIP 1559 AND EIP 2930
  final List<Access>? _accessList;
// EIP 1559 AND EIP 2930
  @override
  List<Access>? get accessList {
    final value = _accessList;
    if (value == null) return null;
    if (_accessList is EqualUnmodifiableListView) return _accessList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Transaction(from: $from, type: $type, nonce: $nonce, to: $to, value: $value, input: $input, gasPrice: $gasPrice, gasLimit: $gasLimit, chainId: $chainId, maxPriorityFeePerGas: $maxPriorityFeePerGas, maxFeePerGas: $maxFeePerGas, accessList: $accessList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Transaction &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.nonce, nonce) || other.nonce == nonce) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.gasPrice, gasPrice) ||
                other.gasPrice == gasPrice) &&
            (identical(other.gasLimit, gasLimit) ||
                other.gasLimit == gasLimit) &&
            (identical(other.chainId, chainId) || other.chainId == chainId) &&
            (identical(other.maxPriorityFeePerGas, maxPriorityFeePerGas) ||
                other.maxPriorityFeePerGas == maxPriorityFeePerGas) &&
            (identical(other.maxFeePerGas, maxFeePerGas) ||
                other.maxFeePerGas == maxFeePerGas) &&
            const DeepCollectionEquality()
                .equals(other._accessList, _accessList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      from,
      type,
      nonce,
      to,
      value,
      input,
      gasPrice,
      gasLimit,
      chainId,
      maxPriorityFeePerGas,
      maxFeePerGas,
      const DeepCollectionEquality().hash(_accessList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      __$$_TransactionCopyWithImpl<_$_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionToJson(
      this,
    );
  }
}

abstract class _Transaction extends Transaction {
  const factory _Transaction(
      {final String? from,
      final String? type,
      required final BigInt nonce,
      required final String to,
      required final BigInt value,
      final String input,
      required final BigInt gasPrice,
      required final BigInt gasLimit,
      final int chainId,
      final BigInt? maxPriorityFeePerGas,
      final BigInt? maxFeePerGas,
      final List<Access>? accessList}) = _$_Transaction;
  const _Transaction._() : super._();

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  String? get from;
  @override
  String? get type;
  @override
  BigInt get nonce;
  @override
  String get to;
  @override
  BigInt get value;
  @override
  String get input;
  @override
  BigInt get gasPrice;
  @override
  BigInt get gasLimit;
  @override
  int get chainId;
  @override // EIP 1559
  BigInt? get maxPriorityFeePerGas;
  @override
  BigInt? get maxFeePerGas;
  @override // EIP 1559 AND EIP 2930
  List<Access>? get accessList;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
