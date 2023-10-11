import 'dart:convert';
import 'dart:io';

import 'package:conferance_app/model/user_model.dart';
import 'package:conferance_app/services/http_services/api_response_helper_class.dart';
import 'package:conferance_app/utils/custom_snackbar_class.dart';
import 'package:conferance_app/utils/local_storage.dart';
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
        LocalStorageRepository localStorageRepository= LocalStorageRepository();
          var data = await jsonDecode(response.body);
          localStorageRepository.setToken(data['token']);
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


Future getUserData({required BuildContext context}) async {
    try {
      http.Response response = await get(
          "api/user/userInfo",
          
          );
      print(response.body);
      switch (response.statusCode) {
        case 200:
        LocalStorageRepository localStorageRepository= LocalStorageRepository();
          var data = await jsonDecode(response.body);

          print(data);
          localStorageRepository.getToken();
 
          UserModel? userModel = UserModel.fromJson(data['data']);
          return userModel;
        default:
     
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




  Future updateUser({required BuildContext context,UserModel? userModel}) async {
    try {
      http.Response response = await putWithToken(
          "api/user/userInfo",
          {jsonEncode(userModel!.toJson())},
          ''
          
          
          );
      print(response.body);
      switch (response.statusCode) {
        case 200:
        LocalStorageRepository localStorageRepository= LocalStorageRepository();
          var data = await jsonDecode(response.body);

          print(data);
          localStorageRepository.getToken();
 
          UserModel? userModel = UserModel.fromJson(data['data']);

          CustomSnackBar.buildSuccessSnackbar(context, 'Updated');

          return userModel;
        default:
     
      CustomSnackBar.buildErrorSnackbar(context, response.reasonPhrase.toString());

          throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      CustomSnackBar.buildErrorSnackbar(context, 'No Internet');
      throw NoInternetException('No Internet');
      
    } on HttpException {
       CustomSnackBar.buildErrorSnackbar(context, 'No Service Found');
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
       CustomSnackBar.buildErrorSnackbar(context, 'Invalid Data Format');
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
       CustomSnackBar.buildErrorSnackbar(context, e.toString());
      throw UnknownException(e.toString());
    }
  }


}
