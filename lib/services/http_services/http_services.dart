import 'package:http/http.dart' as http;

import 'dart:convert';

import '../../constants/app_constant.dart';

// Http Get request
Future<http.Response> get(String endPoint) {
  String url = AppConstants.baseUrl + endPoint;

  Uri uri = Uri.parse(url);
  return http.get(uri ,  headers: {'Content-Type': 'application/json',
 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTI2OWExM2VlNDA2MTMzZTdhMWExZWYiLCJlbWFpbCI6Im1vaEBnLmNvbSIsImlhdCI6MTY5NzAzMjEwNiwiZXhwIjoxNjk3MjkxMzA2fQ.kBhyxMWgr12Q7442xo20yd-hEblNj3mERWeipTqLUtw'});
}

// Http Post request withotut Token
Future<http.Response> post(String endPoint, body) {
  String url = AppConstants.baseUrl + endPoint;

  Uri uri = Uri.parse(url);
  return http.post(uri,
      headers: {'Content-Type': 'application/json'}, body: body);
}





Future<http.Response> put(String endPoint, body) {
  String url = AppConstants.baseUrl + endPoint;

  Uri uri = Uri.parse(url);
  return http.put(uri,
      headers: {'Content-Type': 'application/json'}, body: body);
}

//post with token
Future<http.Response> postWithToken(String endPoint) async {
  // var token = await getUserTokenFromSharedPref();

  String url = AppConstants.baseUrl + endPoint;

  Uri uri = Uri.parse(url);
  return http.post(uri, headers: {
    // 'Authorization': 'Bearer $token',
     'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTI2OWExM2VlNDA2MTMzZTdhMWExZWYiLCJlbWFpbCI6Im1vaEBnLmNvbSIsImlhdCI6MTY5NzAzMjEwNiwiZXhwIjoxNjk3MjkxMzA2fQ.kBhyxMWgr12Q7442xo20yd-hEblNj3mERWeipTqLUtw'
  });
}

//post with token body
Future<http.Response> postWithTokenBody(String endPoint, body) async {
  // var token = await getUserTokenFromSharedPref();

  String url = AppConstants.baseUrl + endPoint;

  Uri uri = Uri.parse(url);
  return http.post(uri,
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTI2OWExM2VlNDA2MTMzZTdhMWExZWYiLCJlbWFpbCI6Im1vaEBnLmNvbSIsImlhdCI6MTY5NzAzMjEwNiwiZXhwIjoxNjk3MjkxMzA2fQ.kBhyxMWgr12Q7442xo20yd-hEblNj3mERWeipTqLUtw'
      },
      body: body);
}

Future<http.Response> postBodyWithoutToken(String endPoint, body) async {
  String url = AppConstants.baseUrl + endPoint;

  Uri uri = Uri.parse(url);
  return http.post(uri,
      headers: {'Content-Type': 'application/json'}, body: body);
}

//get with token
Future<http.Response> getWithToken(String endPoint) async {
  // var token = await getUserTokenFromSharedPref();

  String url = AppConstants.baseUrl + endPoint;
  // print("_get: $url");
  Uri uri = Uri.parse(url);
  return http.get(uri, headers: {
    // 'Authorization': 'Bearer $token',
  });
}

//delete with token
Future<http.Response> deleteWithToken(String endPoint) async {
  // var token = await getUserTokenFromSharedPref();

  String url = AppConstants.baseUrl + endPoint;

  Uri uri = Uri.parse(url);
  return http.delete(uri, headers: {
    // 'Authorization': 'Bearer $token',
  });
}

//delete without token
Future<http.Response> deleteWithoutToken(String endPoint) async {
  String url = AppConstants.baseUrl + endPoint;

  Uri uri = Uri.parse(url);
  return http.delete(uri);
}

// Http Put request
Map<String, String> getRequestHeaders() {
  String authToken = "";
  return {'Authorization': 'Bearer $authToken'};
}

// Convert To JSON
Map<String, dynamic> convertJsonToMap(String response) {
  return json.decode(response);
}

Future<http.Response> putWithToken(String endPoint, body, String token) {
  String url = AppConstants.baseUrl + endPoint;

  Uri uri = Uri.parse(url);
  return http.put(uri,
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTI2OWExM2VlNDA2MTMzZTdhMWExZWYiLCJlbWFpbCI6Im1vaEBnLmNvbSIsImlhdCI6MTY5NzAzMjEwNiwiZXhwIjoxNjk3MjkxMzA2fQ.kBhyxMWgr12Q7442xo20yd-hEblNj3mERWeipTqLUtw'
      },
      body: body);
}
