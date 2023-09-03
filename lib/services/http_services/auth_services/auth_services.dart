import 'dart:convert';
import 'dart:io';

import 'package:conferance_app/services/http_services/api_response_helper_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../screens/auth/login/login_screen.dart';
import '../../../screens/auth/login/login_screen.dart';
import '../http_services.dart';

class AuthServices {
  // Sign IN
  Future signIn({required String email, required String password}) async {
    try {
      http.Response response = await post(
          "api/auth/login",
          json.encode(
              {"email": email, "password": password, "type": "patient"}));
      print(response.body);
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);
          // storeUserTokenInSharedPref(data['accessToken']);
          // UserModel? rNetUser = await getUserData();
          // return rNetUser;
          return 200;
        default:
          // scaffoldKey.currentState;
          ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
              SnackBar(content: Text(response.reasonPhrase.toString())));

          throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      throw NoInternetException('No Internet');
    } on HttpException {
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
