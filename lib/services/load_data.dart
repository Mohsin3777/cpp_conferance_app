import 'package:conferance_app/providers/auth_provider.dart';
import 'package:conferance_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadData{
    static Future<void> getUserData(
      {required BuildContext context}) async {
    // LocalStorageRepository localStorage = LocalStorageRepository();
    // await localStorage.getToken().then((value){});

    final authProvider =  Provider.of<AuthProvider>(context,listen: false);

   await authProvider.loadUserData(context);
  }

}