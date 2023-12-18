import 'dart:convert';
import 'package:http/http.dart' as http;

class SuggestionsApi {
  static const baseUrl = "http://192.168.8.101:3000/api/";

  static Future<List> getSuggestions(String query) async {
    final url = Uri.parse("${baseUrl}items?searchTerm=$query");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('sucess');
        return List.from(data);
      } else {
        print("Failed to get suggestions");
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
