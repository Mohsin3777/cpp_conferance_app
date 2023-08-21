import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpcomingEventTextRow extends StatelessWidget {
  const UpcomingEventTextRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.all(10.sp),
      color: Color(0xffF3FFFF),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/star_location_svg.svg'),
          SizedBox(
            width: 10.w,
          ),
          RichText(
            text: TextSpan(
                text: '29+  ',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                    color: Color(0xff95BEBE)),
                children: [
                  TextSpan(
                    text: 'Upcoming events found',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: Color(0xff95BEBE)),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
