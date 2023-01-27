import 'package:freezed_annotation/freezed_annotation.dart';

part 'block.freezed.dart';
part 'block.g.dart';

@freezed
class Block with _$Block {
  const factory Block({
    required String hash,
    required String parentHash,
    required String sha3Uncles,
    required String miner,
    required String stateRoot,
    required String transactionsRoot,
    required String receiptsRoot,
    required String logsBloom,
    required String difficulty,
    required BigInt number,
    required BigInt gasLimit,
    required BigInt gasUsed,
    required BigInt timestamp,
    required String extraData,
    required String mixHash,
    required BigInt nonce,
    required String totalDifficulty,
    required BigInt baseFeePerGas,
    required String size,
    required List<String> transactions,
    required List<String> uncles,
  }) = _Block;

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
}
