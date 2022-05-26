import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> persist(String privateKey) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: "_pk", value: privateKey);
}

Future<String?> fetch() async {
  const storage = FlutterSecureStorage();
  return storage.read(key: "_pk");
}