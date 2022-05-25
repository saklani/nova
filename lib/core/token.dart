import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token extends Equatable {
  final String name;
  final String symbol;
  final int decimals;

  const Token({
    required this.name,
    required this.symbol,
    required this.decimals,
  });

  @override
  List<Object?> get props => [name, symbol, decimals];
}
