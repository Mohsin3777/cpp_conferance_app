import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawerTile extends StatelessWidget {
  final String svgImgPath;
  final String text;
  const CustomDrawerTile({
    Key? key,
    required this.svgImgPath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(svgImgPath),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
