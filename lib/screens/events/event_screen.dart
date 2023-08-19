// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conferance_app/screens/events/widgets/upcoming_event_card.dart';
import 'package:conferance_app/screens/home/widgers/custom_home_screen_card.dart';
import 'package:conferance_app/screens/home/widgers/customtabbar.dart';
import 'package:conferance_app/widgets/custom_notification_with_dot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:conferance_app/constants/app_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {},
        ),
        title: Text(
          'PEC Events',
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
      body: Container(
        height: 1.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTabBar(
              tabController: tabController,
              ontap: (val) {
                setState(() {});
              },
              tabs: [
                CustomEventTab(tabController: tabController),
                CustomEventTab(tabController: tabController),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.h),
              padding: EdgeInsets.all(10.sp),
              color: Color(0xffF3FFFF),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/star_location_svg.svg'),
                  RichText(
                    text: TextSpan(
                        text: '29+ ',
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
            ),
            SizedBox(
              height: 20.h,
            ),
            _heading(text: 'Todays Events'),
            SizedBox(
              height: 20.h,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppConstants.CONSTANT_COLOR,
                ),
                padding: EdgeInsets.all(5.sp),
                child: CustomHomeScreenCard(
                  backgroundColor: AppConstants.CONSTANT_COLOR,
                )),
            SizedBox(
              height: 20.h,
            ),
            _heading(text: 'Upcoming Events'),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              // height: 200,
              child: TabBarView(controller: tabController, children: [
                ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return CustomUpcomingEvent();
                    }),
                Center(child: Text('22')),
              ]),
            )
          ],
        ),
      ),
    );
  }

  _heading({required String text}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: Color(0xff16183B),
            letterSpacing: 2),
      ),
    );
  }
}
