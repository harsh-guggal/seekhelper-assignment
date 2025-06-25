// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BaseService {
  // ignore: constant_identifier_names
  static const BASE_URL = "https://jsonplaceholder.typicode.com";
  static final Map<String, String> headers = {"Content-Type": "application/json"};

  static Future<http.Response> makeUnauthenticatedRequest(String url, {String method = 'GET', body, mergeDefaultHeader = true, Map<String, String>? extraHeaders}) async {
    try {
      if (kDebugMode) {
        print("$method URL: $url");
      }
      extraHeaders ??= {};
      var sentHeaders = mergeDefaultHeader ? {...headers, ...extraHeaders} : extraHeaders;

      switch (method) {
        case 'POST':
          body ??= {};
          return await http.post(Uri.parse(url), headers: headers, body: body);

        case 'GET':
          return await http.get(Uri.parse(url), headers: headers);

        case 'PUT':
          return await http.put(Uri.parse(url), headers: sentHeaders, body: body);

        case 'PATCH':
          return await http.patch(Uri.parse(url), headers: sentHeaders, body: body);

        case 'DELETE':
          return await http.delete(Uri.parse(url), headers: sentHeaders, body: body);

        default:
          return await http.post(Uri.parse(url), headers: sentHeaders, body: body);
      }
    } catch (err) {
      rethrow;
    }
  }
}
