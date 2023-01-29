import 'dart:math';

import 'package:nova/src/models/export.dart';
import 'package:nova/src/account/account_impl.dart';
import 'package:test/test.dart';

void main() {
  group('sign_transaction', () {
    test('Mainnet', () async {
      final privateKey =
          "0x4646464646464646464646464646464646464646464646464646464646464646";
      final account = AccountImpl("ws://test.com");
      final transaction = Transaction(
        nonce: BigInt.from(9),
        to: "0x3535353535353535353535353535353535353535",
        gasLimit: BigInt.from(21000),
        gasPrice: BigInt.from(20 * pow(10, 9)),
        value: BigInt.from(pow(10, 18)),
        chainId: 1,
      );
      final signedTransaction =
          await account.signTransaction(privateKey, transaction);
      expect(
        signedTransaction,
        SignedTransaction(
          nonce: BigInt.from(9),
          to: "0x3535353535353535353535353535353535353535",
          gasLimit: BigInt.from(21000),
          gasPrice: BigInt.from(20 * pow(10, 9)),
          value: BigInt.from(pow(10, 18)),
          input: '',
          messageHash:
              '0xdaf5a779ae972f972197303d7b574746c7ef83eadac0f2791ad23db92e4c8e53',
          v: 37,
          r: BigInt.parse(
            '18515461264373351373200002665853028612451056578545711640558177340181847433846',
          ),
          s: BigInt.parse(
            '46948507304638947509940763649030358759909902576025900602547168820602576006531',
          ),
          rawTransaction:
              '0xf86c098504a817c800825208943535353535353535353535353535353535353535880de0b6b3a76400008025a028ef61340bd939bc2195fe537567866003e1a15d3c71ff63e1590620aa636276a067cbe9d8997f761aecb703304b3800ccf555c9f3dc64214b297fb1966a3b6d83',
          transactionHash:
              '0x33469b22e9f636356c4160a87eb19df52b7412e8eac32a4a55ffe88ea8350788',
        ),
      );
    });
    test('Goerli', () async {
      final privateKey =
          "0x4646464646464646464646464646464646464646464646464646464646464646";
      final account = AccountImpl("ws://test.com");
      final transaction = Transaction(
        nonce: BigInt.from(9),
        to: "0x3535353535353535353535353535353535353535",
        gasLimit: BigInt.from(21000),
        gasPrice: BigInt.from(20 * pow(10, 9)),
        value: BigInt.from(pow(10, 18)),
        chainId: 5,
      );
      final signedTransaction = await account.signTransaction(
        privateKey,
        transaction,
      );
      expect(
        signedTransaction,
        SignedTransaction(
          nonce: BigInt.from(9),
          to: "0x3535353535353535353535353535353535353535",
          gasLimit: BigInt.from(21000),
          gasPrice: BigInt.from(20 * pow(10, 9)),
          input: '',
          value: BigInt.from(pow(10, 18)),
          messageHash:
              '0x99d850fca14eea70979c6cd43892ea70ddd29f880fb90fccc88c2225bdb61194',
          v: 45,
          r: BigInt.parse(
            '0xe5c7dd630ed41e9d6810494d80754a13cc65b6d7809fe33941b888995cc6ac88',
          ),
          s: BigInt.parse(
            '0x6b9d520c3dfbba71a7d8e969669fb45ec046a8f90353a8313357746e59c40e24',
          ),
          rawTransaction:
              '0xf86c098504a817c800825208943535353535353535353535353535353535353535880de0b6b3a7640000802da0e5c7dd630ed41e9d6810494d80754a13cc65b6d7809fe33941b888995cc6ac88a06b9d520c3dfbba71a7d8e969669fb45ec046a8f90353a8313357746e59c40e24',
          transactionHash:
              '0x2e8bb92197db5ac8872582fa51b9fc5ef24d7225c058d0a033091c3bdc780cdc',
        ),
      );
    });
  });
}
