import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEventScreenHeading extends StatelessWidget {
  final String? text;
  const CustomEventScreenHeading({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Text(
        text!,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: Color(0xff16183B),
            letterSpacing: 2),
      ),
    );
  }
}
