import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conferance_app/constants/app_constant.dart';
import 'package:conferance_app/screens/home/widgers/customImage_slider.dart';
import 'package:conferance_app/screens/home/widgers/custom_svg_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/text_field_decoration.dart';
import '../../widgets/custom_notification_with_dot.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppConstants.CONSTANT_COLOR,
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350.h,
                color: AppConstants.CONSTANT_COLOR,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          NotificationIconWithDot(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome,',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'JOHN DOE,',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 35.r,
                            backgroundColor: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: TextFormField(
                        decoration:
                            TextFeildDecorationClass.inputDecoration(context,
                                hintText: 'Search Event',
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                  size: 30.h,
                                )),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        CustomSvgIconButton(
                          backgroundColor: Color(0xff5ED600),
                          svgIcon: 'assets/svg/play_svg_icon.svg',
                        ),
                        CustomSvgIconButton(
                          backgroundColor: Color(0xffFDAE39),
                          svgIcon: 'assets/svg/image_svg_icon.svg',
                        ),
                        CustomSvgIconButton(
                          backgroundColor: Color(0xff959EED),
                          svgIcon: 'assets/svg/handshake_svg_icon.svg',
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              Container(
                height: 300.h,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r))),
                child: CustomImageSlider(),
              ),
              Container(
                height: 20.h,
                color: Colors.white,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Events',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14.sp),
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
              Container(
                color: Colors.white,
                height: 10.h,
              ),
              Container(
                color: Colors.white,
                height: 150.h,
                child: Row(
                  children: [
                    Container(
                      width: 139.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'))),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
