import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository {
  //Set token to Authorization header to check if user is logged in or not
  void setToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('Authorization', token);
  }

  // Get the Authorization token that is saved in shared preferences
  Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('Authorization');
    return token;
  }

  //clear Auth token to Authorization header
  void clearAuthToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('Authorization');
  }

  //Set fhir ID to load user details
  void setfhirID(String fhirid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('fhirid', fhirid);
  }

  // Get fhir ID stored in shared preferences
  Future<String?> getFhirID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? fhirid = preferences.getString('fhirid');
    return fhirid;
  }

  // clear fhir ID from shared preferences
  void clearFhirID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('fhirid');
  }

  //Set set last login in shared preferences
  void setLastLogin(String time) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lastLogin', time);
  }

  // Get last login from shared preferences
  Future<String?> getLastLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('lastLogin');
    return token;
  }

  //clear last login from shared preferences
  void clearLastLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('lastLogin');
  }
}
