import 'dart:convert';

import 'package:list_me/model/item.dart';
import 'package:http/http.dart' as http;

class ItemApi {
  static   Future<List<Item>> getAllItems() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8800/api/items')); // Replace 'items' with your API endpoint

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<Item> items = data.map((itemJson) => Item.fromJson(itemJson)).toList();
      return items;
    } else {
      throw Exception('Failed to load items');
    }
  }
}