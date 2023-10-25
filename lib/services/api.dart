import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_me/model/product_model.dart';

class Api {
  static const baseUrl = "http://10.0.2.2:8800/api/";

static Future <void> createItem(String category, String item, double price, String quantity, String img) async {
  final String apiUrl = 'http://10.0.2.2:8800/api/items'; // Replace with your API endpoint URL

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'category': category,
        'item': item,
        'price': price,
        'quantity': quantity,
        'img': img,
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

  //get method

  static Future<List> getProduct() async {
    print("called");
    List products = [];

    var url = Uri.parse("${baseUrl}get_Product");

    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        // Assuming the API response includes fields for pimage, pprice, and pquantity
        products = data['products'];

        // for (var value in productList) {
        //   products.add(Product(
        //     item: value['pname'],
        //     pimage: value['pimage'],    // Fetch pimage from API response
        //     pprice: value['pprice'],    // Fetch pprice from API response
        //     pquantity: value['pquantity'],  // Fetch pquantity from API response
        //   ));
        // }
        // print("pp/"+data['products'][0]['lTitle'].toString());
      } else {
        //print("Failed to get response");
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
    // print("pp/"+products[0]['lTitle'].toString());
    return products;
  }

  // Update put method
  static updateProduct(id, body) async {
    var url = Uri.parse("${baseUrl}update/$id");

    final res = await http.post(url, body: body);
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("Failed to update data");
    }
  }

  // delete method
  static deleteProduct(int? id) async {
    var url = Uri.parse("${baseUrl}delete/$id");

    final res = await http.post(url);
    try {
      if (res.statusCode == 200) {
        print('manika');
        print(jsonDecode(res.body));
      } else {
        print('Failed to delete');
      }
    } catch (e) {
      print(e);
    }
  }
}
