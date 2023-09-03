import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_constant.dart';

class NotifcationScreen extends StatelessWidget {
  const NotifcationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Clear all',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xff009495),
                  fontSize: 10),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return _notificationCard();
          }),
    );
  }

  _notificationCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1692791256961-b8797139ba2c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ongoing Event',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff009495),
                    fontSize: 10),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '4th International Engineering Conference Deans',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/home_card_location_svg.svg',
                    color: AppConstants.CONSTANT_COLOR,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Pearl Continental',
                    style: TextStyle(
                      color: AppConstants.CONSTANT_COLOR,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          SvgPicture.asset('assets/svg/live_svg.svg')
        ],
      ),
    );
  }
}
