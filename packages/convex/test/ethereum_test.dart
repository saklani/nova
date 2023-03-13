import 'package:convex/convex.dart';
import 'package:test/test.dart';

void main() {
  group('ethereum', () {
    test('hashMessage', () async {
      final message = 'Some data';
      final hash = hashMessage(message);
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
      final response = await sign(key: key, message: message);
      expect(response['signature'], signature);
    });
  });
}
