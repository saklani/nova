import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'block.g.dart';


@JsonSerializable()
class Block extends Equatable {
  final String hash;
  final String parentHash;
  final String sha3Uncles;
  final String miner;
  final String stateRoot;
  final String transactionsRoot;
  final String receiptsRoot;
  final String logsBloom;
  final String difficulty;
  final BigInt number;
  final BigInt gasLimit;
  final BigInt gasUsed;
  final BigInt timestamp;
  final String extraData;
  final String mixHash;
  final BigInt nonce;
  final String totalDifficulty;
  final BigInt baseFeePerGas;
  final String size;
  final List<String> transactions;
  final List<String> uncles;

  Block({
    required this.hash,
    required this.parentHash,
    required this.sha3Uncles,
    required this.miner,
    required this.stateRoot,
    required this.transactionsRoot,
    required this.receiptsRoot,
    required this.logsBloom,
    required this.difficulty,
    required this.number,
    required this.gasLimit,
    required this.gasUsed,
    required this.timestamp,
    required this.extraData,
    required this.mixHash,
    required this.nonce,
    required this.totalDifficulty,
    required this.baseFeePerGas,
    required this.size,
    required this.transactions,
    required this.uncles,
  });

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);

  Map<String, dynamic> toJson() => _$BlockToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [this.hash];
}
