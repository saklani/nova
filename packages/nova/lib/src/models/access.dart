import 'package:collection/collection.dart';

class Access {
  final String address;
  final List<String> storageKey;

  Access({required this.address, required this.storageKey});

  factory Access.fromJson(Map<String, dynamic> json) => Access(
        address: json["address"].toString(),
        storageKey:
            json["storageKey"].map<String>((e) => e.toString()).toList(),
      );

  Map<String, dynamic> toJson() {
    return {
      "address": this.address,
      "storageKey": this.storageKey,
    };
  }

  @override
  String toString() {
    final content = [
      "address: $address",
      "storageKey: ${storageKey.join(", ")}",
    ].join(', ');
    return '$runtimeType($content)';
  }

  @override
  bool operator ==(Object other) {
    return runtimeType == other.runtimeType &&
        other is Access &&
        other.address == address &&
        IterableEquality().equals(other.storageKey, storageKey);
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        address,
        storageKey,
      );
}
