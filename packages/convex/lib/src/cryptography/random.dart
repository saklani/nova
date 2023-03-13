import 'dart:math';
import 'dart:typed_data';

Uint8List bytes(int size) {
  final random = Random.secure();
  return Uint8List.fromList(List.generate(size, (_) => random.nextInt(255)));
}
