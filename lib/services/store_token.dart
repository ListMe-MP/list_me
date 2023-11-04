import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StoreToken {
  static const storage = FlutterSecureStorage();

  static Future<void> storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  static Future<void> removeToken() async {
    return await storage.delete(key: 'token');
  }
}
