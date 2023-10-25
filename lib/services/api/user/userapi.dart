import 'dart:convert';

import 'package:list_me/model/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<int> registerUser(User user) async {
    int res = 0;
    final String apiUrl =
        'http://10.0.2.2:8800/api/users/register'; // Replace with your actual backend API endpoint

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
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
        // Registration successful
        print('User registered successfully');
        res = 1;
        return res;
        // You can handle the response data here if needed.
        // For example, you might want to store user data in your app's state.
      } else if (response.statusCode == 400) {
        // Username is already taken
        final data = jsonDecode(response.body);
        final error = data['error'];
        print('Registration error: $error');
        return res;
      } else {
        // Handle other error cases
        print('Registration failed with status code: ${response.statusCode}');
        return res;
      }
    } catch (error) {
      print('Error registering user: $error');
      return res;
    }
  }
}
