import 'dart:math';
import 'dart:typed_data';

const random = CryptoRandom._();

class CryptoRandom {
  const CryptoRandom._();

  Uint8List bytes(int size) {
    final random = Random.secure();
    return Uint8List.fromList(List.generate(size, (_) => random.nextInt(255)));
  }
}
