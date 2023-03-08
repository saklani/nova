import 'dart:typed_data';

import 'package:pointycastle/export.dart';

import 'random.dart';
import 'rlp.dart';

const algorithm = CryptoAlgorithm._();

class CryptoAlgorithm {
  const CryptoAlgorithm._();

  RLP get rlp => rlp_;

  Uint8List argon2({
    required Uint8List data,
    int saltSize = 32,
    int blockLength = 128,
    int t = 1024,
    int desiredKeyLength = 32,
  }) {
    if (saltSize < 16) {
      throw ArgumentError("Salt must have at least 16 bytes");
    }
    final salt = random.bytes(saltSize);
    final derivator = Argon2BytesGenerator();
    derivator.init(
      Argon2Parameters(
        Argon2Parameters.ARGON2_id,
        salt,
        desiredKeyLength: desiredKeyLength,
        iterations: t,
      ),
    );
    return derivator.process(data);
  }

  /// Applies a keccak hash to a bytes array.
  /// Defaults to keccak256.
  Uint8List keccak(Uint8List data, {int bits = 256}) =>
      KeccakDigest(bits).process(data);

  /// Applies a SHA256 hash to a bytes array
  Uint8List sha256(Uint8List data) => SHA256Digest().process(data);
}
