import 'package:conferance_app/constants/app_constant.dart';
import 'package:conferance_app/screens/gallery/single_day_gallery_screen.dart';
import 'package:conferance_app/screens/gallery/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/custom_appbar.dart';

class GalleryHomeScreen extends StatelessWidget {
  const GalleryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        title: 'Gallery',
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
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
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Uploads',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16.sp),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          color: AppConstants.CONSTANT_COLOR,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return CustomImageWidget();
                  }),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'My Uploads',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Day 1',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          letterSpacing: 2,
                          color: Color(0xff545454)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SingleDayGallery();
                        }));
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: AppConstants.CONSTANT_COLOR,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return CustomImageWidget();
                  }),
                ),
              ),

              //2 day
              SizedBox(
                height: 20.h,
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Day ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          letterSpacing: 2,
                          color: Color(0xff545454)),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          color: AppConstants.CONSTANT_COLOR,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return CustomImageWidget();
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
