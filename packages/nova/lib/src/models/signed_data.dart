class SignedData {
  final String hash;
  final BigInt r;
  final BigInt s;

  SignedData({
    required this.hash,
    required this.r,
    required this.s,
  });

  factory SignedData.fromJson(Map<String, dynamic> json) => SignedData(
        hash: json['hash'],
        r: BigInt.parse(json['r'].toString()),
        s: BigInt.parse(json['s'].toString()),
      );
  Map<String, dynamic> toJson() => {
        'hash': hash,
        'r': r.toString(),
        's': s.toString(),
      };

  @override
  String toString() {
    final content = [
      "hash: $hash",
      "r: $r",
      "s: $s",
    ].join(', ');
    return '$runtimeType($content)';
  }

  @override
  bool operator ==(Object other) {
    return runtimeType == other.runtimeType &&
        other is SignedData &&
        other.hash == hash &&
        other.r == r &&
        other.s == s;
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        hash,
        r,
        s,
      );
}
