import 'package:collection/collection.dart';

class Block {
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

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        hash: json["hash"],
        parentHash: json["parentHash"],
        sha3Uncles: json["sha3Uncles"],
        miner: json["miner"],
        stateRoot: json["stateRoot"],
        transactionsRoot: json["transactionsRoot"],
        receiptsRoot: json["receiptsRoot"],
        logsBloom: json["logsBloom"],
        difficulty: json["difficulty"],
        number: BigInt.parse(json["number"].toString()),
        gasLimit: BigInt.parse(json["gasLimit"].toString()),
        gasUsed: BigInt.parse(json["gasUsed"].toString()),
        timestamp: BigInt.parse(json["timestamp"].toString()),
        extraData: json["extraData"],
        mixHash: json["mixHash"],
        nonce: BigInt.parse(json["nonce"].toString()),
        totalDifficulty: json["totalDifficulty"],
        baseFeePerGas: BigInt.parse(json["baseFeePerGas"].toString()),
        size: json["size"],
        transactions: json["transactions"].map<String>((e) => e.toString()).toList(),  
        uncles: json["uncles"].map<String>((e) => e.toString()).toList(),
      );

  Map<String, dynamic> toJson() => {
        'hash': hash,
        'parentHash': parentHash,
        'sha3Uncles': sha3Uncles,
        'miner': miner,
        'stateRoot': stateRoot,
        'transactionsRoot': transactionsRoot,
        'receiptsRoot': receiptsRoot,
        'logsBloom': logsBloom,
        'difficulty': difficulty,
        'number': number.toString(),
        'gasLimit': gasLimit.toString(),
        'gasUsed': gasUsed.toString(),
        'timestamp': timestamp.toString(),
        'extraData': extraData,
        'mixHash': mixHash,
        'nonce': nonce.toString(),
        'totalDifficulty': totalDifficulty,
        'baseFeePerGas': baseFeePerGas.toString(),
        'size': size,
        'transactions': transactions,
        'uncles': uncles,
      };

  @override
  String toString() {
    final content = [
      "hash: $hash",
      "parentHash: $parentHash",
      "sha3Uncles: $sha3Uncles",
      "miner: $miner",
      "stateRoot: $stateRoot",
      "transactionsRoot: $transactionsRoot",
      "receiptsRoot: $receiptsRoot",
      "logsBloom: $logsBloom",
      "difficulty: $difficulty",
      "number: $number",
      "gasLimit: $gasLimit",
      "gasUsed: $gasUsed",
      "timestamp: $timestamp",
      "extraData: $extraData",
      "mixHash: $mixHash",
      "nonce: $nonce",
      "totalDifficulty: $totalDifficulty",
      "baseFeePerGas: $baseFeePerGas",
      "size: $size",
      "transactions: ${transactions.join(", ")}",
      "uncles: ${uncles.join(", ")}",
    ].join(', ');
    return '$runtimeType($content)';
  }

  @override
  bool operator ==(Object other) {
    return runtimeType == other.runtimeType &&
        other is Block &&
        other.hash == hash &&
        other.parentHash == parentHash &&
        other.sha3Uncles == sha3Uncles &&
        other.miner == miner &&
        other.stateRoot == stateRoot &&
        other.transactionsRoot == transactionsRoot &&
        other.receiptsRoot == receiptsRoot &&
        other.logsBloom == logsBloom &&
        other.difficulty == difficulty &&
        other.number == number &&
        other.gasLimit == gasLimit &&
        other.gasUsed == gasUsed &&
        other.timestamp == timestamp &&
        other.extraData == extraData &&
        other.mixHash == mixHash &&
        other.nonce == nonce &&
        other.totalDifficulty == totalDifficulty &&
        other.baseFeePerGas == baseFeePerGas &&
        other.size == size &&
        IterableEquality().equals(other.transactions, transactions) &&
        IterableEquality().equals(other.uncles, uncles);
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        hash,
        parentHash,
      );
}
