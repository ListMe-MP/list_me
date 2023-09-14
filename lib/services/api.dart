import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_me/model/product_model.dart';

class Api {
  static const baseUrl = "http://192.168.8.183/api/";

  static addProduct(Map pdata) async {
    var url = Uri.parse("${baseUrl}add_product");

    try {
      final res = await http.post(url, headers: {
        "Content-Type":"application/json",
      }, body: json.encode(pdata));

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failded to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //get method 

<<<<<<< HEAD
  static Future<List> getProduct() async {
    print("called");
  List products = [];
=======
  static  Future <List<Product>>getProduct() async {
  List<Product> products = [];
>>>>>>> 1c8ac4e4d1fc984c52e50a27ea8eb3259b1ea559

  // var url = Uri.parse("${baseUrl}get_Product");
  var url = Uri.parse("http://localhost:2000/api/get_product/");
  late http.Response response;

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
    return [];
  }
  // print("pp/"+products[0]['lTitle'].toString());
  return products;
  } }