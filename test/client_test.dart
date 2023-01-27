import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nova/core/block.dart';
import 'package:nova/core/transaction.dart';
import 'package:nova/nova.dart';
import 'package:test/test.dart';

import 'client.mocks.dart';

@GenerateMocks([Client])
void main() {
  group('client', () {
    const jsonBlock = {
      "baseFeePerGas": "0x125fd0246",
      "difficulty": "0x2",
      "extraData":
          "0xd883010a11846765746888676f312e31372e38856c696e757800000000000000772b04c47b06ebc84208bc5faba7ae4551a9c6a82ad1db41a997fdc93dbe21645ae9267be1bc32988db203cd6fb51e20c4c5eefc4e211a3643ea49bfe9a4263101",
      "gasLimit": "0x1c9c380",
      "gasUsed": "0xe0999e",
      "hash":
          "0xece8b6b89223ce93127428c70c4dc482a829194a3f48dd1520be416e0917d643",
      "logsBloom":
          "0x0c244a1c4a4c421450bc6240d8904001110202c2404004100c81020080a8013e880050400052100d30480570020018010800300402206c04404640c0ca2480c514410438002008097380494c089093300001032d402580224830e001804012d1044b0a0a02100031b080258484080800010484d002485280b10020b18888824028248a082c44002041db6800043860200a810000808400088602034840d0004e4224c08400d0210a9948094926054086104044c800880502a05091400084280300004c0b08811067188410819a9a00012d8040420c0400190b003378008060006190418099300c72462004120c48af400020608a40b0aa280810000108114001",
      "miner": "0x0000000000000000000000000000000000000000",
      "mixHash":
          "0x0000000000000000000000000000000000000000000000000000000000000000",
      "nonce": "0x0000000000000000",
      "number": "0xa1d21f",
      "parentHash":
          "0xbaabb7d336406313c8a4c63cc70f4b4af5388e7f91bff41c849a0b385193579a",
      "receiptsRoot":
          "0xf232d20c5d74e13365333872236a45d16038146c7f150dfd12c17441215f71ca",
      "sha3Uncles":
          "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
      "size": "0x8954",
      "stateRoot":
          "0x2f5cb6e0b00a72a9393453a93257d53f95b22c30253cf4eb04537294a23b1679",
      "timestamp": "0x626f9a21",
      "totalDifficulty": "0x10b9979",
      "transactions": [
        "0xf84caf4a5c8dc49fa84332ad0601a159f6c29dd4ac24f3a414025a3bd3c63118",
        "0xcb28568f729f087e55cf81d22a1364cbce45921be9ca36a7a131a1a6ec4e1355",
        "0xd1bf947fa8685393fbbae1728b5eb0aedc12bbc2b682e40c7133526729d309e3",
        "0x5be6d3f1c340be81474b559f70d7811a38da9c71daef6e337cb9d2d2cf8c4e50",
        "0xf925a9382bdf3edf7b72bc0449ae4ce269c988adf1b66577554814c4e40faa13",
        "0x98ddcb75307b274953452d13d937d5d2c8aa95ed6e5dcbebf6776f413de3cd44",
        "0x177f839f862ee03938ac45349378277d96eddad2c08feb7f00dec8d2e435b2d5",
        "0x75ff50aaf56b04d9881c093eac86fd0a830a7fe0be4b841256db01f6ae8a50d6",
        "0x7b5228c1aee013f5f5e32650370276bc9bb09508c857289a9ed2534de2682ea3",
        "0xb43020b8b5630b097fb8d8434754686d38df6ac26098ceff1f4a43381c28fb94",
        "0xbe7b41829d1fe0806510f4cf5a55e7bf891adf0b1173ae82fd8c706058af43be",
        "0xd42faf2a6a3193b72cd11bd507d8e4fa3ea1992a1ce262eb63a24dff25be48fa",
        "0x5a1424720c271e49f2f488fed2cc09ac137dc989220817ca494d1a3f308c419a",
        "0x94e8748d93fbec333048dcaa151dd7fb01c3eb17d4635f51f58489c6da07067a",
        "0x052458c1484caa9d9b90cbba879249c0d1a1c41456bfc8d74de6d438fe031745",
        "0x1abbe2fcbf9ffd5fb26e2c0564d6f615b65b04370e03034eaae54788e3ec2906",
        "0xaaf2830267684c74256d4fb4cb617c58275c993a3c212cac972d4263198324f3",
        "0x0bb2a1c481027bece0a67ec2187a3ff466de4fdb4be9d3469bd4782a6f1ff5c9",
        "0x013ef49f89fbc0a2026401ec0305fdcbdc0e61958f31704d75756954ba88ea99",
        "0x89c798c5f265aec056e75d130ce74480f68e7d12718902476a6b40bfe0fe5a54",
        "0x24c0cb4f7fd87cd7261bedd932e859b48008bb743a17d05548e5a0dd6e3a44b9",
        "0x4d71afbc8dafd93dd43ca38c9a0b0c33cfe7c16474b4435a52fc587dba033360",
        "0xe22a322495b8ac1c955b568c129d3c1f11298a25f2dedf5e9a5fee6912ed5c11",
        "0x23861eb0a3c3ac36645c4e104cb2f052e42ade9f4260405921b7555c01e41a8c",
        "0x7f9c5f20e53c6e1c5a4ef3c1dc34beb17804229c767d8d8aa76694318bf570ea",
        "0xba4642275acf6c83f2679153b2acc8b03d2a0b7605fef84adc7b5b7670afa70c",
        "0x4b499648ffc007f1aa6a0e99aec630fef5ef4971ee615285ec56601b726fc2ee",
        "0x4f54b4930e4ff23c0c2d025945e5f3447fda046f6ea97851a76596df669bcddf",
        "0xef377fe41bc5eac2a3e0efa6ca4685bc11f5403aa4f4868703ba9388217c7932",
        "0xfdffdadf84b78a415e4211e08e6f01736efeb6bec84ccfe55517ce6a1573b384",
        "0xa01adb88d7a48ca2a1c7ef90592de819a6bcf8e980c28cac6ad304a4a424c109",
        "0x24e1784dc09cd9ed71a173a49404cc585f17ff29352a4acc5bb6c1970b7cb4de",
        "0x623b98940e8d32b7180efb150cdd4c4b775a522a758ba3cc9c2512ace6a1396b",
        "0xc4fd424a47cea0ee85e48d2ce34bd12375c0f244091c07ef8ff1055f5e5a073d",
        "0x7167456872e469f99efd2a60cb1488b7d87f9b7ccce06f0da5ffa4f3c568bb17",
        "0x4547ea4f6cbf8196aa003f672e504616f8ce2b563636d62a5fceb5839ad41e48",
        "0x2b2c457545e55664c7918d27bef8cf4170a48d2dc36932666de437e318ede67c",
        "0x4145c77d8f0f772d0123f5b55076cb3b438d0da05bcb94baeb562011d71b38af",
        "0xe6a0d61c968bdca98b2fd54b6377b5ac199525555bc40225f77b07b2022d087d",
        "0xc5604bd2d78df9b5161198f15ccb6ab48119d6b7cbae4d0d94688c23ed2365c9",
        "0x59678bfb255c0ea24b73212fbd2ea4ec9dbc9bbe13bd02dc137a16d865228e6f",
        "0x786f63b258caf89bd47c2f9bbc9006e44950c5835c5fc5ea46db78b1d52f52ac",
        "0xd9832c58f139b0fb5c6edc975ef49f1ee5cfdfc54bb7f038dc378d3d8b80e81a",
        "0x8b2d23ee9e135ca68b434f1929da06a78f37f192e999e6661f3784b325c79db7",
        "0x50239f0aba9fd7efe508d760b65ca1aa429eeaf7079b91a529b75d795510cb47",
        "0xcf7720ee85ba32f57edf9debb3ed94aa83b8b570ae71e64eb66d7d9ee6879877",
        "0xd615ebf0ac027487d7cd262aa6af13c60eb30ce097afd4f5c8edb06cfea7da2c",
        "0x5fc57086926e1578a4594454b0b771a0b7d63e487497010b77563d69f34c7715",
        "0x59a2982eb895d8d7794f35cd8dfe344c3f0baee38ffcded3091c1d1cae76d986",
        "0x9f2333fe89a6f92cdd578d9513a63830a8de53d371a433e28a118737e0fda43b",
        "0xa688b6800940d1c284ccc4b173d667f94f39098c2f19aec1865839dec6e4e502",
        "0x98fe60b7e09f976d53414a867167968f54dd099c786fd8b867366768e56e2210",
        "0x7ed4537e7c87a783c2d1b4947bd4338191e1f7aba3134a39fc334a041d989cf1",
        "0x5b555dd1ad6fba6a27a941fd37f757d7b27e3c2216353bc96faab97a011daec5",
        "0xa6f40ed7af2cdadbf17fbebbd36f2f0cdad81648df5738ab7a9c16b3a6f5c77c",
        "0x068cf2b18bf12ddab0ce0187e842c830570f914c89470a86bbca27bd0ac3824c",
        "0xd8a23139aee0176d3c5be9375ac40e624ceef6b8ef90c071183118ffd243ddf8",
        "0x678a999ee63ef4199d0e67a6c8f11473faa9fee57bcdf94a49f219abcec6c8d8",
        "0x42a9dd777937eedb7a51986ef79f99e792ff836cb4035e4052b6605f4f259058",
        "0x034c4baa51f5f10fe211666504d65df4e188b878b053c521caf3482ad5457049",
        "0x82a0b4df366af3f013775e71749483d30498449fb3ae6334460ad714fe6effbf",
        "0x9ef225e3dc3a511a318fdb257c04681bc9327a9a17ca303fc24af76779c05a2e",
        "0x1e047ad15ed75231015d43b0858f94f788f88f6b8b6395fbf9c2a118edba1c85",
        "0x7e2df03fec4beea82f3d543c75268ad801f84cadeeb16594b2060643c72399bf",
        "0xaf1c6aad6ac26c9cbd34964531db99b9d6ebc493f9291adbcef8d0795bd40ee2",
        "0x66c3f73543e3d73f6f75251ed69a3e1f736ca0b458a17e71ace5ddeea1d18110",
        "0x1f38152240c7b21640b03cffb766ea84310ee5f2b49a0ac3ec764ac6e8b12f3f",
        "0x746efc8c815b4b4047944d00837aa3c9c5580d4f90bd775987199219a389d855",
        "0xfad083d1445c0c5c929ea255162d5babc13c87a5f5d4838f40f2fa9236af6bff",
        "0xfe5a97ccd3df3bdb51ea0e6ceaf77bfd5387424bbab96348270a4f47b6512aa5",
        "0x4d7423dab838b92f66cfa095c0b87beacad5b3e65fed22f54722f189b9a87806",
        "0xb386e70d15d2cbf83ad012007dfb697bd7e616d978bea5a7c9e542682966b58d"
      ],
      "transactionsRoot":
          "0x867784cd3587d2c15b6c09a1d6c45eadf51df587dbf6bcf634e9f622bc3e0b2b",
      "uncles": []
    };

    test('eth_protocolVersion', () async {
      final jsonRPC = MockClient();
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(jsonRPC.sendRequest('eth_protocolVersion')).thenAnswer(
        (_) => Future.value("0x41"),
      );
      final client = Nova.from(jsonRPC);
      expect(await client.protocolVersion(), 65);
    });

    test('eth_gasPrice', () async {
      final jsonRPC = MockClient();
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(jsonRPC.sendRequest('eth_gasPrice')).thenAnswer(
        (_) => Future.value("0x2241"),
      );
      final client = Nova.from(jsonRPC);
      expect(await client.gasPrice(), BigInt.from(8769));
    });

    test('eth_getBlockByHash', () async {
      final jsonRPC = MockClient();
      const hash = "0xa7684ac44d48494670b2e0dd5e70c1db854";
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(jsonRPC.sendRequest('eth_getBlockByHash', [hash, false])).thenAnswer(
        (_) => Future.value(jsonBlock),
      );
      final client = Nova.from(jsonRPC);
      expect(
        await client.getBlockByHash(hash),
        Block.fromJson(jsonBlock),
      );
    });

    test('eth_getBlockByNumber', () async {
      final jsonRPC = MockClient();
      BigInt number = BigInt.from(14573498);
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(
        jsonRPC.sendRequest(
          'eth_getBlockByNumber',
          [number.toRadixString(16), false],
        ),
      ).thenAnswer(
        (_) => Future.value(jsonBlock),
      );
      final client = Nova.from(jsonRPC);
      expect(
        await client.getBlockByNumber(number),
        Block.fromJson(jsonBlock),
      );
    });

    test('eth_chainId', () async {
      final jsonRPC = MockClient();
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(jsonRPC.sendRequest('eth_chainId')).thenAnswer(
        (_) => Future.value("0x4"),
      );
      final client = Nova.from(jsonRPC);
      expect(await client.chainId(), 4);
    });

    test('eth_blockNumber', () async {
      final jsonRPC = MockClient();
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(jsonRPC.sendRequest('eth_blockNumber')).thenAnswer(
        (_) => Future.value("0xde5fba"),
      );
      final client = Nova.from(jsonRPC);
      expect(await client.blockNumber(), BigInt.from(14573498));
    });

    test('eth_call', () async {
      final transaction = Transaction(
        nonce: BigInt.zero,
        to: '0x20f46dA6B50Aa37fbB50Aa37fb79aB9163B33d',
        gasLimit: BigInt.from(21000),
        gasPrice: BigInt.from(400),
        chainId: 1,
        input: '',
        value: BigInt.zero,
      );
      final jsonRPC = MockClient();
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(
        jsonRPC.sendRequest(
          'eth_call',
          [transaction.to0xMap()],
        ),
      ).thenAnswer(
        (_) => Future.value("0x20f46dA6B50Aa37fbB50Aa37fb79aB9163B33d"),
      );
      final client = Nova.from(jsonRPC);
      expect(
        await client.call(transaction),
        "0x20f46dA6B50Aa37fbB50Aa37fb79aB9163B33d",
      );
    });

    test('eth_estimateGas', () async {
      final jsonRPC = MockClient();
      final transaction = Transaction(
        nonce: BigInt.zero,
        to: '0x20f46dA6B50Aa37fbB50Aa37fb79aB9163B33d',
        gasLimit: BigInt.from(21000),
        gasPrice: BigInt.from(400),
        chainId: 1,
        input: '',
        value: BigInt.zero,
      );
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(
        jsonRPC.sendRequest(
          'eth_estimateGas',
          [transaction.to0xMap()],
        ),
      ).thenAnswer((_) => Future.value("0x20f4"));
      final client = Nova.from(jsonRPC);
      expect(
        await client.estimateGas(transaction),
        BigInt.from(8436),
      );
    });

    test('eth_sign', () async {
      String address = "0x222ADd4196400f42dA6B60Aa37fb79aC9163B33dd";
      String message = "0x20f46dA6B50Aa37fbB50Aa37fb79aB9163B33d";

      final jsonRPC = MockClient();
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(jsonRPC.sendRequest('eth_sign', [address, message])).thenAnswer(
        (_) => Future.value("0x1"),
      );
      final client = Nova.from(jsonRPC);
      expect(
        await client.sign(address, message),
        "0x1",
      );
    });

    test('eth_getBalance', () async {
      String address = "0x222ADd4196400f42dA6B60Aa37fb79aC9163B33dd";
      final jsonRPC = MockClient();
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(
        jsonRPC.sendRequest(
          'eth_getBalance',
          [address, "latest"],
        ),
      ).thenAnswer(
        (_) => Future.value("0x133522"),
      );
      final client = Nova.from(jsonRPC);
      expect(
        await client.getBalance(address),
        BigInt.from(1258786),
      );
    });

    test('eth_getTransactionCount', () async {
      String address = "0x222ADd4196400f42dA6B60Aa37fb79aC9163B33dd";
      final jsonRPC = MockClient();
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(jsonRPC.sendRequest('eth_getTransactionCount', [address, "latest"]))
          .thenAnswer(
        (_) => Future.value("0x20f"),
      );
      final client = Nova.from(jsonRPC);
      expect(
        await client.getTransactionCount(address),
        BigInt.parse("0x20f"),
      );
    });

    test('eth_sendTransaction', () async {
      final transaction = Transaction(
        nonce: BigInt.zero,
        to: '0x20f46dA6B50Aa37fbB50Aa37fb79aB9163B33d',
        gasLimit: BigInt.from(21000),
        gasPrice: BigInt.from(400),
        chainId: 1,
        input: '',
        value: BigInt.zero,
      );
      final jsonRPC = MockClient();
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(jsonRPC.sendRequest(
        'eth_sendTransaction',
        [transaction.to0xMap()],
      )).thenAnswer(
        (_) => Future.value(
          "0x20f46dA6B50Aa37fbB50Aa37fb79aB9163B33d",
        ),
      );
      final client = Nova.from(jsonRPC);
      expect(
        await client.sendTransaction(transaction),
        "0x20f46dA6B50Aa37fbB50Aa37fb79aB9163B33d",
      );
    });

    test('eth_sendRawTransaction', () async {
      final data = "0x222ADd4196400f42dA6B60Aa37f163B33dd";
      final jsonRPC = MockClient();
      when(jsonRPC.listen()).thenAnswer((_) => Future.value(''));
      when(jsonRPC.sendRequest('eth_sendRawTransaction', [data])).thenAnswer(
        (_) => Future.value(
          "0x222ADd4196400f42dA6B6Dd4196400f42dA6B60Aa37f163B33dd",
        ),
      );
      final client = Nova.from(jsonRPC);
      expect(await client.sendRawTransaction(data),
          "0x222ADd4196400f42dA6B6Dd4196400f42dA6B60Aa37f163B33dd");
    });
  });
}
