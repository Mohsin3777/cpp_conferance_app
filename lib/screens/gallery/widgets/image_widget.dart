import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageWidget extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;
  const CustomImageWidget({super.key, this.image, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      height: height ?? 120.h,
      width: width ?? 120.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          image: DecorationImage(
              image: NetworkImage(image ??
                  'https://images.unsplash.com/photo-1561489396-888724a1543d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGV2ZW50fGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60'),
              fit: BoxFit.cover)),
    );
  }
}
