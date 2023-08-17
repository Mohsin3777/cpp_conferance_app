import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_constant.dart';

class CustomSvgIconButton extends StatelessWidget {
  Color? backgroundColor;
  final String svgIcon;

  CustomSvgIconButton({
    Key? key,
    required this.svgIcon,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
          color: backgroundColor ?? AppConstants.CONSTANT_COLOR,
          borderRadius: BorderRadius.circular(10.r)),
      width: 140.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(svgIcon),
          Text(
            'Play Event',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
