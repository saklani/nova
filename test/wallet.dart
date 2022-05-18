import 'dart:math';

import 'package:convert/convert.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nova/core.dart';
import 'package:supernova/supernova.dart';

void main() {
  group('wallet', () {
    test('wallet.encode', () {
      final web3 = Wallet(
        "0x4646464646464646464646464646464646464646464646464646464646464646",
        "ws://test.test",
      );
      final transaction = Transaction(
          nonce: 9,
          to: "0x3535353535353535353535353535353535353535",
          gasLimit: BigInt.from(21000),
          gasPrice: BigInt.from(20 * pow(10, 9)),
          value: BigInt.from(pow(10, 18)),
          chainId: 1,
          input: '');
      final hash = web3.encode(transaction);
      expect(
        hex.encode(hash),
        "daf5a779ae972f972197303d7b574746c7ef83eadac0f2791ad23db92e4c8e53",
      );
    });

    test('wallet.sign', () async {
      final web3 = Wallet(
        "0x4646464646464646464646464646464646464646464646464646464646464646",
        "ws://test.test",
      );
      final signedTransaction = await web3.sign(
        nonce: 9,
        to: "0x3535353535353535353535353535353535353535",
        gasLimit: BigInt.from(21000),
        gasPrice: BigInt.from(20 * pow(10, 9)),
        value: BigInt.from(pow(10, 18)),
        chainId: 1,
      );
      expect({
        'messageHash': signedTransaction.messageHash,
        'v': signedTransaction.v,
        'r': signedTransaction.r,
        's': signedTransaction.s,
        'rawTransaction': signedTransaction.rawTransaction,
        'transactionHash': signedTransaction.transactionHash,
      }, {
        'messageHash':
            '0xdaf5a779ae972f972197303d7b574746c7ef83eadac0f2791ad23db92e4c8e53',
        'v': 37,
        'r': BigInt.parse(
            '18515461264373351373200002665853028612451056578545711640558177340181847433846'),
        's': BigInt.parse(
            '46948507304638947509940763649030358759909902576025900602547168820602576006531'),
        'rawTransaction':
            '0xf86c098504a817c800825208943535353535353535353535353535353535353535880de0b6b3a76400008025a028ef61340bd939bc2195fe537567866003e1a15d3c71ff63e1590620aa636276a067cbe9d8997f761aecb703304b3800ccf555c9f3dc64214b297fb1966a3b6d83',
        'transactionHash':
            '0x33469b22e9f636356c4160a87eb19df52b7412e8eac32a4a55ffe88ea8350788'
      });
    });
  });
}
