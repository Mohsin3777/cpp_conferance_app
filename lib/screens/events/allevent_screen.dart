import 'package:conferance_app/screens/events/event_details_screen.dart';
import 'package:conferance_app/screens/events/widgets/custom_event_heading.dart';
import 'package:conferance_app/screens/events/widgets/upcoming_event_card.dart';
import 'package:conferance_app/screens/events/widgets/upcoming_event_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_constant.dart';
import '../../utils/screentype.dart';
import '../home/widgers/custom_home_screen_card.dart';

class AllEventScreen extends StatelessWidget {
  const AllEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UpcomingEventTextRow(),
          SizedBox(
            height: 20.h,
          ),
          CustomEventScreenHeading(text: 'Todays Events'),
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
                onpress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EventDetailsScreen();
                  }));
                },
                Screentype: ScreenName.event.toString(),
                backgroundColor: AppConstants.CONSTANT_COLOR,
                textColor: Colors.white,
              )),
          SizedBox(
            height: 20.h,
          ),
          CustomEventScreenHeading(text: 'Upcoming Events'),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return CustomUpcomingEvent();
                }),
          ),
        ],
      ),
    );
  }
}
