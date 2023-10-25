import 'dart:convert';

import 'package:http/http.dart' as http;

class PostApi{
  static Future <void> createItem()async {
  final String apiUrl = 'http://10.0.2.2:8800/api/items'; // Replace with your API endpoint URL

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
      
      }),
    );

    if (response.statusCode == 200) {
      // Item created successfully
      final Map<String, dynamic> responseData = json.decode(response.body);
      print('Item created: $responseData');
    } else {
      // Handle API error
      print('Failed to create item. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      // You can handle the error response here
    }
  } catch (e) {
    // Handle network or other errors
    print('Error creating item: $e');
    // You can handle the error here
  }
}
}