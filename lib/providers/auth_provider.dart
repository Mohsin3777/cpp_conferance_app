import 'package:conferance_app/model/user_model.dart';
import 'package:conferance_app/services/http_services/auth_services/auth_services.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {

  UserModel userModel = UserModel();

   bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


  updateUserModel(String name){
userModel.name =name;
notifyListeners();
  }


loadUserData(BuildContext context)async{
  _isLoading=true;
 await _loadUserData(context);
  _isLoading=false;
  notifyListeners();
}

  _loadUserData(BuildContext context)async{
    AuthServices _authServices = AuthServices();
     userModel =       await   _authServices.getUserData(context: context);
  }

  updateUser(BuildContext context,UserModel? userModel ,String? image)async{
  _isLoading=true;
 await _updateUser(context,userModel,image!);
  _isLoading=false;
  notifyListeners();
}

  _updateUser(BuildContext context ,UserModel? userModel,String? image)async{
    AuthServices _authServices = AuthServices();
     userModel =       await   _authServices.updateUser(context: context,userModel: userModel,image: image!);
  }
}
