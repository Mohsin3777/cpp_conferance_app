// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_constant.dart';
import '../../events/widgets/upcoming_event_card.dart';

class CustomHomeScreenCard extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String? Screentype;

  final String? screenName;
  const CustomHomeScreenCard({
    Key? key,
    this.backgroundColor,
    this.screenName,
    this.textColor,
    required this.Screentype,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      // height: 170.h,
      color: backgroundColor ?? Colors.white,
      child: Row(
        children: [
          _cardImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            // width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '1.4 KM',
                      style: TextStyle(
                        color: textColor ?? Color(0xffACB1D9),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.h,
                        color: textColor ?? Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  '18 March, 2021',
                  style: TextStyle(
                    color: textColor ?? AppConstants.CONSTANT_COLOR,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '4th International Engineering Conference Deans',
                  style: TextStyle(
                    color: textColor ?? Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                  maxLines: 3,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/home_card_location_svg.svg',
                      color: textColor ?? AppConstants.CONSTANT_COLOR,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Pearl Continental',
                      style: TextStyle(
                        color: textColor ?? AppConstants.CONSTANT_COLOR,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                screenName == 'home'
                    ? CustomGradientColorButton()
                    : Container(
                        child: Row(
                          children: [
                            ImageStack(),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              '10+ Going',
                              style: TextStyle(
                                color: textColor ?? AppConstants.CONSTANT_COLOR,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            SvgPicture.asset('assets/svg/live_svg.svg')
                          ],
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _cardImage({required String imageUrl}) {
    return Container(
      height: 170.h,
      width: 132.w,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(25.r)),
      child: Container(
          margin: EdgeInsets.only(left: 5.w, top: 5.h),
          width: 40.w,
          height: 56.h,
          // padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white.withOpacity(0.8),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '21',
                style: TextStyle(
                  color: Color(0xff747092),
                  fontSize: 19.sp,
                ),
              ),
              Text(
                'Mar',
                style: TextStyle(
                  color: Color(0xff747092),
                  fontSize: 9.sp,
                ),
              )
            ],
          )),
    );
  }
}

class CustomGradientColorButton extends StatelessWidget {
  const CustomGradientColorButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 116.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff029899),
              Color(0xff31AC8B),
              Color(0xff61C17C)
            ]),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            'View Event',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          )),
    );
  }
}
