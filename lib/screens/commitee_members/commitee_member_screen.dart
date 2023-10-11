import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_notification_with_dot.dart';

class CommiteeMemberScreen extends StatelessWidget {
  const CommiteeMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Committee Members',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp),
        ),
        centerTitle: true,
        actions: [
          NotificationIconWithDot(
            iconColor: Colors.black,
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: Container(
              // height: 1.sh,
              // width: 1.sw,
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0.w,
                    mainAxisSpacing: 8.0.h,
                    childAspectRatio: 3 / 3),
                itemBuilder: (BuildContext context, int index) {
                  return CustomCommiteeMemberCardWidget(
                    width: 140.w,
                    height: 1400.h,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCommiteeMemberCardWidget extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;
  const CustomCommiteeMemberCardWidget(
      {super.key, this.image, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      // height: height ?? 100.h,
      // width: width ?? 80.w,
      height: height,
      width: width,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        // border: Border(
        //     bottom: BorderSide(
        //   color: Colors.orange,
        //   width: 50,
        // )),
        image: DecorationImage(
            image: NetworkImage(image ??
                'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODB8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'),
            opacity: 1,
            fit: BoxFit.cover),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Engr. Prof M.Najeeb Haroon',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Colors.white),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Co Chair Technical Committee',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 8.sp,
                color: Colors.white),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
