import 'dart:async';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static final client = new http.Client();

  Future<ApiResponse> request(
      {@required Method method,
      @required String url,
      dynamic body,
      Map headers}) async {
    String fullUrl = 'http://192.168.1.5:3002$url';

//    Map<String, dynamic> headers = { 'Authorization': User.token != null ? 'Bearer  ${User.token}' : null };
    Map<String, dynamic> headers = {};

    http.Response response = await _callMethod(method, fullUrl, body, headers);

    return ApiResponse(response);
  }

  Future<http.Response> _callMethod(
      Method method, String url, dynamic body, Map headers) {
    switch (method) {
      case Method.get:
        return _get(url, headers);

      case Method.post:
        return _post(url, body, headers);

      case Method.put:
        return _put(url, body, headers);

      case Method.delete:
        return _delete(url, headers);
    }
  }

  Future<http.Response> _get(String url, Map headers) async {
    return await client.get(url, headers: Map.from(headers));
  }

  Future<http.Response> _post(url, body, headers) async {
    return await client.post(url, body: body, headers: Map.from(headers));
  }

  Future<http.Response> _put(String url, Map body, Map headers) async {
    return await client.put(url, body: body, headers: Map.from(headers));
  }

  Future<http.Response> _delete(String url, Map headers) async {
    return await client.delete(url, headers: headers);
  }
}

class ApiResponse {
  int statusCode;
  Map body;
  Map headers;

  ApiResponse(http.Response response) {
    this.statusCode = response.statusCode;
    this.body =
        response.bodyBytes.length > 0 ? _bodyToJson(response.bodyBytes) : {};
    this.headers = response.headers;
  }

  static Map _bodyToJson(bodyBytes) {
    return jsonDecode(utf8.decode(bodyBytes));
  }
}

enum Method { get, post, put, delete }
