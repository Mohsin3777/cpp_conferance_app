import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_constant.dart';

class CustomSvgIconButton extends StatelessWidget {
  Color? backgroundColor;
  final String svgIcon;
  final String? title;
  final VoidCallback? onpress;

  CustomSvgIconButton({
    Key? key,
    required this.svgIcon,
    this.backgroundColor,
    this.onpress,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
            color: backgroundColor ?? AppConstants.CONSTANT_COLOR,
            borderRadius: BorderRadius.circular(37.r)),
        width: 140.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(svgIcon),
            Text(
              title ?? 'Play Event',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
