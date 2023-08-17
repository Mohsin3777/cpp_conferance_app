import 'package:conferance_app/screens/auth/resetpassword/change_password.dart';
import 'package:conferance_app/screens/auth/resetpassword/resat_password.dart';
import 'package:conferance_app/screens/intro/intro_screen.dart';
import 'package:conferance_app/screens/splash/splash_screen.dart';
import 'package:conferance_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Conferance App',
            theme: MyTheme.lightTheme(),
            // home: ResetPasswordScreen(),
            // home: ChangePasswordScreen()
            home: SplashScreen(),
          );
        });
  }
}
