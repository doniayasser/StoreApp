import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/shared/components/constants.dart';

class Api
{
  Future<dynamic> get({required String url,@required String? token}) async
  {
    Map<String,String> headers={};
    if(headers != null)
    {
      headers.addAll({"Authorization":"Bearer $token"});
    }
    http.Response response= await http.get(Uri.parse(url));
    if(response.statusCode==200)
      {
        return jsonDecode(response.body);
      }
    else
      {
        throw Exception("There is a problem with status code ${response.statusCode} ");
      }
  }

  Future<dynamic> post({required String url,@required dynamic body,@required String? token} ) async
  {
    Map<String,String> headers={};
    if(headers != null)
      {
        headers.addAll({"Authorization":"Bearer $token"});
      }
      
    http.Response response =await http.post(
        Uri.parse(apiUrl),body: body,
      headers: headers,
    );
    if(response.statusCode==200) {
      return jsonDecode(response.body);
    }
    else
      {
        throw Exception(
            "There is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)} ",
        );
      }

  }

  Future<dynamic> put({required String url,@required dynamic body,@required String? token} ) async
  {
    Map<String,String> headers={};
    headers.addAll({"Content-Type":"application/x-www-form-urlencoded"});
    if(headers != null)
    {
      headers.addAll({"Authorization":"Bearer $token"});
    }

    http.Response response =await http.put(
      Uri.parse(apiUrl),body: body,
      headers: headers,
    );
    if(response.statusCode==200) {
      return jsonDecode(response.body);
    }
    else
    {
      throw Exception(
        "There is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)} ",
      );
    }

  }
}