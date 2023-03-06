import 'package:convex/convex.dart';
import 'package:test/test.dart';

void main() {
  group('cryptography', () {
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
      final rlp = crypto.encode(data);
      expect(
        rlp.toHex(),
        "0xec098504a817c800825208943535353535353535353535353535353535353535880de0b6b3a764000080018080",
      );
    });

    group('keccak', () {
      test('234', () {
        final data = "234";
        final keccak = crypto.keccak(data.toBytes());
        expect(
          keccak.toHex(),
          "0xc1912fee45d61c87cc5ea59dae311904cd86b84fee17cc96966216f811ce6a79",
        );
      });
      test('withdraw(uint256)', () {
        final data = "withdraw(uint256)";
        final keccak = crypto.keccak(data.toBytes());
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
        final rlp = crypto.encode(data);
        final keccak = crypto.keccak(rlp);
        expect(
          keccak.toHex(),
          "0xdaf5a779ae972f972197303d7b574746c7ef83eadac0f2791ad23db92e4c8e53",
        );
      });
    });
    test('hashMessage', () async {
      final message = 'Some data';
      final hash = crypto.hashMessage(message);
      expect(
        hash.toHex(),
        "0x1da44b586eb0729ff70a73c326926f6ed5a25f5b056e7f47fbc6e58d86871655",
      );
    });
    test('erecover', () {
      // TODO: implement
    });

    test('sign', () async {
      final key =
          '0xbe6383dad004f233317e46ddb46ad31b16064d14447a95cc1d8c8d4bc61c3728';
      final message = 'Some data';
      final signature =
          '0xa8037a6116c176a25e6fc224947fde9e79a2deaa0dd8b67b366fbdfdbffc01f953e41351267b20d4a89ebfe9c8f03c04de9b345add4a52f15bd026b63c8fb1501b';
      final response = await crypto.sign(key: key, message: message);
      expect(response['signature'], signature);
    });
  });
}
