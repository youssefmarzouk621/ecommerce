import 'package:flutter_ecommerce_app/src/config/statics.dart';
import 'package:http/http.dart' as http;

class RequestController {
  Future<http.Response> get({String apiRoute,Map<String, String> headers}) async {
    final response = await http.get(Uri.http(baseURL, apiRoute), headers: headers).timeout(const Duration(seconds: 10));
    return response;
  }

  Future<http.Response> post({String apiRoute, Map<String, dynamic> body,Map<String, String> headers}) async {
    final response = await http.post(Uri.http(baseURL, apiRoute),body: body, headers: headers).timeout(const Duration(seconds: 10));
    return response;
  }





}