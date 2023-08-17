import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      // primarySwatch: Colors.blue,
      primarySwatch: Colors.teal,
      inputDecorationTheme: _customInputDecorationTheme(
          borderSideColor: const Color(0xff757575).withOpacity(0.93)),
    );
  }

  static InputDecorationTheme _customInputDecorationTheme(
      {required Color borderSideColor}) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      borderSide: BorderSide(color: borderSideColor, width: 0.5),
    );
    return InputDecorationTheme(
      filled: false,
      isDense: true,
      border: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );
  }
}
