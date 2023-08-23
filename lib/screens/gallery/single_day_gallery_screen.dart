import 'package:conferance_app/constants/app_constant.dart';
import 'package:conferance_app/screens/gallery/widgets/image_widget.dart';
import 'package:conferance_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleDayGallery extends StatelessWidget {
  const SingleDayGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        title: 'Gallery',
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Event Details',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppConstants.CONSTANT_COLOR),
            ),
            SizedBox(height: 10.h),
            Text(
              '4th International Engineering \nConference Deans',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/home_card_location_svg.svg',
                  color: AppConstants.CONSTANT_COLOR,
                ),
                SizedBox(width: 10.h),
                Text(
                  'Pearl Continental',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppConstants.CONSTANT_COLOR),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'My Uploads',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                  // padding: EdgeInsets.all(12.0),
                  child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0.w,
                  mainAxisSpacing: 8.0.h,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CustomImageWidget(
                      // width: 140.w,
                      // height: 140.h,
                      );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
