import 'dart:convert';
import 'dart:io';

import 'package:conferance_app/practice/practice_event_model.dart';
import 'package:conferance_app/services/http_services/api_response_helper_class.dart';
import 'package:conferance_app/services/http_services/http_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constants/app_constant.dart';
import '../../../utils/custom_snackbar.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_snackbar.dart';

class EventServices {
  static Future addEvent(
      // {required List<dynamic> schedulList, required List listOfdays}
      {BuildContext? context,
      EventModelData? eventModelData,
      String? filePath}) async {
    try {
      http.Response response = await post("api/event/createEvent", json.encode(
          //   {
          //   "title": "FIsrt",
          //   "description": "254tnv akag gnkja",
          //   "dateOfEvent": listOfdays,
          //   "daySchedule": schedulList,
          // },

          eventModelData!.toJson()));

      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);
          print(data['data']['_id']);

          // UploadIMage(
          //     context: context!,
          //     filePath: filePath.toString(),
          //     docId: '',
          //     eventModelData: eventModelData);
          if (filePath!.isNotEmpty && filePath != '') {
            var uploadImgStatus = await UploadIMage(
                context: context!,
                filePath: filePath.toString(),
                docId: data['data']['_id'],
                eventModelData: eventModelData);

            return uploadImgStatus;
          } else {
            return data['data']['_id'];
          }
        // storeUserTokenInSharedPref(data['accessToken']);

        // UserModel? rNetUser = await getUserData();
        // return rNetUser;
        // CustomSnackBar.buildSuccessSnackbar(context, 'Success');

        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      CustomSnackBar.buildErrorSnackbar(context!, 'NO Internet');
      throw NoInternetException('No Internet');
    } on HttpException {
      CustomSnackBar.buildErrorSnackbar(context!, 'No Service Found');
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      CustomSnackBar.buildErrorSnackbar(context!, 'Invalid Data Format');

      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      CustomSnackBar.buildErrorSnackbar(context!, e.toString());

      throw UnknownException(e.toString());
    }
  }

//new func
  static Future UploadIMage(
      // {required List<dynamic> schedulList, required List listOfdays}
      {required BuildContext context,
      required String docId,
      EventModelData? eventModelData,
      required String filePath}) async {
    try {
      String addimageUrl =
          AppConstants.baseUrl + 'api/event/uploadTitleImageInEvent/$docId';

      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        // 'charset': 'utf-8'
      };

      var request = http.MultipartRequest('PUT', Uri.parse(addimageUrl))
        ..headers.addAll(headers)
        // ..fields.addAll(json.encode(eventModelData!.toJson()))
        ..files.add(await http.MultipartFile.fromPath('image', filePath));
      // request.fields = json.encode(eventModelData!.toJson());
      request.fields['data'] = json.encode(eventModelData!.toJson());
      var streamResponse = await request.send();

      var response = await http.Response.fromStream(streamResponse);
      print(response.body);
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);

          CustomSnackBar.buildSuccessSnackbar(
              context, 'Successfully upload image');
          // storeUserTokenInSharedPref(data['accessToken']);

          // UserModel? rNetUser = await getUserData();
          // return rNetUser;
          return data['data']['_id'];
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      CustomSnackBar.buildErrorSnackbar(context, 'NO Internet');
      throw NoInternetException('No Internet');
    } on HttpException {
      CustomSnackBar.buildErrorSnackbar(context, 'No Service Found');
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      CustomSnackBar.buildErrorSnackbar(context, 'Invalid Data Format');
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      CustomSnackBar.buildErrorSnackbar(context, e.toString());
      throw UnknownException(e.toString() + 'aaaaaaaaaaaaaaaaaaa');
    }
  }

//dummy function for upload image
  static Future<bool> addImage(
      Map<String, String> body, String filepath) async {
    String addimageUrl = AppConstants.baseUrl + 'api/event/createEvent';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    var response = await request.send();
    if (response.statusCode == 200) {
      print('yesss');
      return true;
    } else {
      print('false');
      return false;
    }
  }
  //update event

  static Future addScheduleInEvent(
      {List<DaySchedule>? daySchedule, required String id}) async {
    try {
      http.Response response = await put("api/event/addScheduleInEvent/$id",
          json.encode({"daySchedule": daySchedule}));
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);
          PracticeEventModel practiceEventModel =
              PracticeEventModel.fromJson(data);

          print(response.body);
          print(daySchedule);
          // storeUserTokenInSharedPref(data['accessToken']);

          // UserModel? rNetUser = await getUserData();
          // return rNetUser;
          return 200;
        default:
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

  // getSingleEvent with id
  static Future getSingleEventWithId(
      {String? id, required BuildContext context}) async {
    try {
      http.Response response = await get(
        "api/event/getSingleEventWithId/$id",
      );
      // print(response.body);
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);
          // storeUserTokenInSharedPref(data['accessToken']);

          // UserModel? rNetUser = await getUserData();
          // return rNetUser;

          PracticeEventModel practiceEventModel =
              PracticeEventModel.fromJson(data);
          return practiceEventModel;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      CustomSnackBar.buildErrorSnackbar(context, 'NO Internet');
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
