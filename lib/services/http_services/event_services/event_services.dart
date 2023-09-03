import 'dart:convert';
import 'dart:io';

import 'package:conferance_app/practice/practice_event_model.dart';
import 'package:conferance_app/services/http_services/api_response_helper_class.dart';
import 'package:conferance_app/services/http_services/http_services.dart';
import 'package:http/http.dart' as http;

class EventServices {
  static Future addEvent({required List<dynamic> schedulList , required List listOfdays}) async {
    try {
      http.Response response = await post(
          "api/event/createEvent",
          json.encode({
            "title": "FIsrt",
            "description": "254tnv akag gnkja",
            "dateOfEvent": listOfdays,
            "daySchedule": schedulList,

          }));
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


  //update event

   static Future addScheduleInEvent(List<DaySchedule>? daySchedule ) async {
    try {
      http.Response response = await put(
          "api/event/addScheduleInEvent/64f4d2d62a5842c0c91fba3e",
          json.encode({
       
"daySchedule":daySchedule
          }));
 
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);
            PracticeEventModel practiceEventModel = PracticeEventModel.fromJson(data);

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
      http.Response response = await get("api/event/getSingleEventWithId/64f4d2d62a5842c0c91fba3e",);
      // print(response.body);
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);
          // storeUserTokenInSharedPref(data['accessToken']);

          // UserModel? rNetUser = await getUserData();
          // return rNetUser;

          
  PracticeEventModel practiceEventModel = PracticeEventModel.fromJson(data);
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
