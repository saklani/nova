class SignedTransaction {
  final BigInt nonce;
  final String to;
  final BigInt value;
  final String input;
  final BigInt gasPrice;
  final BigInt gasLimit;
  final int v;
  final BigInt r;
  final BigInt s;
  final String messageHash;
  final String rawTransaction;
  final String transactionHash;

  SignedTransaction({
    required this.nonce,
    required this.to,
    required this.value,
    required this.input,
    required this.gasPrice,
    required this.gasLimit,
    required this.v,
    required this.r,
    required this.s,
    required this.messageHash,
    required this.rawTransaction,
    required this.transactionHash,
  });

  factory SignedTransaction.fromJson(Map<String, dynamic> json) =>
      SignedTransaction(
        nonce: BigInt.parse(json['nonce'].toString()),
        to: json['to'],
        value: BigInt.parse(json['value'].toString()),
        input: json['input'],
        gasPrice: BigInt.parse(json['gasPrice'].toString()),
        gasLimit: BigInt.parse(json['gasLimit'].toString()),
        v: int.parse(json['value'].toString()),
        r: BigInt.parse(json['r'].toString()),
        s: BigInt.parse(json['s'].toString()),
        messageHash: json['messageHash'],
        rawTransaction: json['rawTransaction'],
        transactionHash: json['transactionHash'],
      );

  Map<String, dynamic> toJson() => {
        'nonce': nonce.toString(),
        'to': to,
        'value': value.toString(),
        'input': input,
        'gasPrice': gasPrice.toString(),
        'gasLimit': gasLimit.toString(),
        'v': v.toString(),
        'r': r.toString(),
        's': s.toString(),
        'messageHash': messageHash,
        'rawTransaction': rawTransaction,
        'transactionHash': transactionHash,
      };

  List<BigInt> get raw => [
        nonce,
        gasPrice,
        gasLimit,
        BigInt.parse(to),
        value,
        BigInt.parse(input.isEmpty ? '0' : input),
        BigInt.from(v),
        r,
        s,
      ];

  Map<String, String> serialize() {
    return {
      'messageHash': messageHash,
      'v': '0x${v.toRadixString(16)}',
      'r': '0x${r.toRadixString(16)}',
      's': '0x${s.toRadixString(16)}',
      'rawTransaction': rawTransaction,
      'transactionHash': transactionHash,
    };
  }

  @override
  String toString() {
    final content = [
      "nonce: $nonce",
      "to: $to",
      "value: $value",
      "input: $input",
      "gasPrice: $gasPrice",
      "gasLimit: $gasLimit",
      "v: $v",
      "r: $r",
      "s: $s",
      "messageHash: $messageHash",
      "rawTransaction: $rawTransaction",
      "transactionHash: $transactionHash",
    ].join(', ');
    return '$runtimeType($content)';
  }

  @override
  bool operator ==(Object other) {
    return runtimeType == other.runtimeType &&
        other is SignedTransaction &&
        other.nonce == nonce &&
        other.to == to &&
        other.value == value &&
        other.input == input &&
        other.gasPrice == gasPrice &&
        other.gasLimit == gasLimit &&
        other.v == v &&
        other.r == r &&
        other.s == s &&
        other.messageHash == messageHash &&
        other.rawTransaction == rawTransaction &&
        other.transactionHash == transactionHash;
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        nonce,
        to,
        value,
        input,
        gasPrice,
        gasLimit,
        v,
        r,
        s,
        messageHash,
        rawTransaction,
        transactionHash,
      );
}
