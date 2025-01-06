import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  Future<dynamic> getMethod(String url, {VoidCallback? onUnAuthorize}) async {
    try {
      Uri uri = Uri.parse(url);
      final Response response = await http.get(uri, headers: {"token": ""});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          log("status code ${response.statusCode}");
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> postMethod(String url,
      {VoidCallback? onUnAuthorize, Map<String, String>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      final Response response = await http.post(uri,
          headers: {"Content-Type": "application/json", "token": ""},
          body: body);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          log("status code ${response.statusCode}");
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
