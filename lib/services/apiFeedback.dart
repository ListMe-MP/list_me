import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiFeedback{
  //static const baseUrl = "http://192.168.8.118/apiFeedback/";
  static const baseUrl = "http://192.168.8.118/api/";
   //static const baseUrl = "http://192.168.8.101/api_feedback/";
  
  static addfeedback(Map pdata) async
  //static Future<void> addFeedback(Map<String, dynamic> pdata) async
  {
    var url = Uri.parse("${baseUrl}add_feedback");
    //print(pdata);
    //var url = Uri.parse(baseUrl+"");
    //var url = Uri.parse("$baseUrl/api/add_feedback");
    // var url = Uri.parse("$baseUrl/add_feedback");
    
    try{
     // final res = await http.post(url, body: pdata);
      final res = await http.post(url, headers: {
        "Content-Type":"application/json",
      }, body: json.encode(pdata));
      print("hello");

       if(res.statusCode == 200){
        var data = jsonDecode(res.body.toString());
        print(data);
        print("hii");

      //
      }else{
        //print("Failed to get response");
        print("Failed to get response. Status code: ${res.statusCode}");
        print("Response body: ${res.body}");
        //
      }


    }catch(e){
      //debugPrint(e.toString());
      print("Error: $e");
    }
  }

}