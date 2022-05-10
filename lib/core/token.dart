import 'package:equatable/equatable.dart';

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
