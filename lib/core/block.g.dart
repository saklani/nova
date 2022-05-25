// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Block _$BlockFromJson(Map<String, dynamic> json) => Block(
      hash: json['hash'] as String,
      parentHash: json['parentHash'] as String,
      sha3Uncles: json['sha3Uncles'] as String,
      miner: json['miner'] as String,
      stateRoot: json['stateRoot'] as String,
      transactionsRoot: json['transactionsRoot'] as String,
      receiptsRoot: json['receiptsRoot'] as String,
      logsBloom: json['logsBloom'] as String,
      difficulty: json['difficulty'] as String,
      number: BigInt.parse(json['number'] as String),
      gasLimit: BigInt.parse(json['gasLimit'] as String),
      gasUsed: BigInt.parse(json['gasUsed'] as String),
      timestamp: BigInt.parse(json['timestamp'] as String),
      extraData: json['extraData'] as String,
      mixHash: json['mixHash'] as String,
      nonce: BigInt.parse(json['nonce'] as String),
      totalDifficulty: json['totalDifficulty'] as String,
      baseFeePerGas: BigInt.parse(json['baseFeePerGas'] as String),
      size: json['size'] as String,
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      uncles:
          (json['uncles'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BlockToJson(Block instance) => <String, dynamic>{
      'hash': instance.hash,
      'parentHash': instance.parentHash,
      'sha3Uncles': instance.sha3Uncles,
      'miner': instance.miner,
      'stateRoot': instance.stateRoot,
      'transactionsRoot': instance.transactionsRoot,
      'receiptsRoot': instance.receiptsRoot,
      'logsBloom': instance.logsBloom,
      'difficulty': instance.difficulty,
      'number': instance.number.toString(),
      'gasLimit': instance.gasLimit.toString(),
      'gasUsed': instance.gasUsed.toString(),
      'timestamp': instance.timestamp.toString(),
      'extraData': instance.extraData,
      'mixHash': instance.mixHash,
      'nonce': instance.nonce.toString(),
      'totalDifficulty': instance.totalDifficulty,
      'baseFeePerGas': instance.baseFeePerGas.toString(),
      'size': instance.size,
      'transactions': instance.transactions,
      'uncles': instance.uncles,
    };
