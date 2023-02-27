import 'package:nova/src/cryptography/cryptography_impl.dart';
import 'package:nova/src/extension.dart';
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
      final rlp = CryptographyImpl.encode(data);
      expect(
        rlp.hex(),
        "0xec098504a817c800825208943535353535353535353535353535353535353535880de0b6b3a764000080018080",
      );
    });

    test('keccak', () {
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
      final rlp = CryptographyImpl.encode(data);
      final keccak = CryptographyImpl.keccak(rlp);
      expect(
        keccak.hex(),
        "0xdaf5a779ae972f972197303d7b574746c7ef83eadac0f2791ad23db92e4c8e53",
      );
    });

    test('generateChecksumAddress', () {
      String privateKey =
          "0x85e2d38a7eaa1965186e01788bc11d779e4b21d8b419d58e8c2dea24baa9a840";
      String address = CryptographyImpl.generateChecksumAddress(privateKey);
      expect(address, "0xf010C15810d8f86aA182F8FAAA1C205e97AF28fB");
    });

    test('derivePrivateKey', () {
      String privateKey = CryptographyImpl.derivePrivateKey(
        "seed sock milk update focus rotate barely fade car face mechanic mercy",
      );
      expect(
        privateKey,
        "0x070dc3117300011918e26b02176945cc15c3d548cf49fd8418d97f93af699e46",
      );
    });

    test('recoverFromSignature', () {
      // TODO: implement
    });

    test('sign', () async {
      // TODO: implement
    });
  });
}
