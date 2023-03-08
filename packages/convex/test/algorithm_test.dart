import 'package:convex/convex.dart';
import 'package:test/test.dart';

void main() {
  group('algorithm', () {
    group('rlp', () {
      test('encode', () {
        final data = [
          '9',
          '20000000000',
          '21000',
          '303763085406030802607040376995933333497115391285',
          '1000000000000000000',
          '0',
          '1',
          '0',
          '0',
        ].map((e) => BigInt.parse(e)).toList();
        final rlp = algorithm.rlp.encode(data);
        expect(
          rlp.toHex(),
          "0xec098504a817c800825208943535353535353535353535353535353535353535880de0b6b3a764000080018080",
        );
      });
    });
    group('keccak', () {
      test('234', () {
        final data = "234";
        final keccak = algorithm.keccak(data.toBytes());
        expect(
          keccak.toHex(),
          "0xc1912fee45d61c87cc5ea59dae311904cd86b84fee17cc96966216f811ce6a79",
        );
      });
      test('withdraw(uint256)', () {
        final data = "withdraw(uint256)";
        final keccak = algorithm.keccak(data.toBytes());
        expect(
          keccak.toHex(),
          "0x2e1a7d4d13322e7b96f9a57413e1525c250fb7a9021cf91d1540d5b69f16a49f",
        );
      });
      test('transaction data', () {
        final data = [
          '9',
          '20000000000',
          '21000',
          '303763085406030802607040376995933333497115391285',
          '1000000000000000000',
          '0',
          '1',
          '0',
          '0',
        ].map((e) => BigInt.parse(e)).toList();
        final rlp = algorithm.rlp.encode(data);
        final keccak = algorithm.keccak(rlp);
        expect(
          keccak.toHex(),
          "0xdaf5a779ae972f972197303d7b574746c7ef83eadac0f2791ad23db92e4c8e53",
        );
      });
    });
  });
}
