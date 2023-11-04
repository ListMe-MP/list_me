import 'dart:convert';
import 'package:list_me/utils/const.dart';
import 'package:list_me/services/store_token.dart';
import 'package:list_me/model/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<int> registerUser(User user) async {
    int res = resFail;

    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:8800/api/auth/register"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': user.username,
          'email': user.email,
          'password': user.password,
        }),
      );

      if (response.statusCode == 200) {
        res = resOk;
        return res;
      } else if (response.statusCode == 400) {
        final data = jsonDecode(response.body);
        final error = data['error'];
print(error);
        return res;
      } else {
        return res;
      }
    } catch (error) {
      return res;
    }
  }

  static Future<int> loginUser(String email, String password) async {
    int res = resFail;
    try {
      final response = await http.post(
        Uri.parse(EndPoint.login),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final userJson = jsonResponse['user'] as Map<String, dynamic>;
        final user = User.fromJson(userJson);
        final token = jsonResponse['accessToken'];
        await StoreToken.storeToken(token);
        res = resOk;
        return res;
      } else {
        return res;
      }
    } catch (e) {
      print(e);
      return res;
    }
  }

  static Future<User> getCurrentUser() async {
    String? token = await StoreToken.getToken();
    final response = await http.get(
      Uri.parse(EndPoint.current),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final userJson = json.decode(response.body) as Map<String, dynamic>;
      final user = User.fromJson(userJson);
      return user;
    } else {
      throw Exception('Failed to get current user');
    }
  }
}
