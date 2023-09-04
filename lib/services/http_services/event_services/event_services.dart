import 'dart:convert';
import 'dart:io';

import 'package:conferance_app/practice/practice_event_model.dart';
import 'package:conferance_app/services/http_services/api_response_helper_class.dart';
import 'package:conferance_app/services/http_services/http_services.dart';
import 'package:http/http.dart' as http;

import '../../../constants/app_constant.dart';

class EventServices {
  static Future addEvent1(
      // {required List<dynamic> schedulList, required List listOfdays}

      EventModelData? eventModelData,
      String filePath) async {
    try {
      http.Response response = await post("api/event/createEvent", json.encode(
          //   {
          //   "title": "FIsrt",
          //   "description": "254tnv akag gnkja",
          //   "dateOfEvent": listOfdays,
          //   "daySchedule": schedulList,
          // },

          eventModelData!.toJson()));
      print(response.body);
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);
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

//new func
  static Future addEvent(
      // {required List<dynamic> schedulList, required List listOfdays}

      EventModelData? eventModelData,
      String filePath) async {
    try {
      String addimageUrl = AppConstants.baseUrl + 'api/event/createEvent';

      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        // 'charset': 'utf-8'
      };

      var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
        ..headers.addAll(headers)
        // ..fields.addAll(json.encode(eventModelData!.toJson()))
        ..files.add(await http.MultipartFile.fromPath('image', filePath));

      var streamResponse = await request.send();

      var response = await http.Response.fromStream(streamResponse);
      print(response.body);
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);
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

  static Future addScheduleInEvent(List<DaySchedule>? daySchedule) async {
    try {
      http.Response response = await put(
          "api/event/addScheduleInEvent/64f5b4805b6aa1043b75b64f",
          json.encode({"daySchedule": daySchedule}));

      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);
          PracticeEventModel practiceEventModel =
              PracticeEventModel.fromJson(data);

          print(daySchedule);
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
  static Future getSingleEventWithId() async {
    try {
      http.Response response = await get(
        "api/event/getSingleEventWithId/64f5b4805b6aa1043b75b64f",
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
