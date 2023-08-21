import 'package:conferance_app/constants/app_constant.dart';
import 'package:conferance_app/screens/events/widgets/custom_event_heading.dart';
import 'package:conferance_app/screens/events/widgets/custom_expandableTile.dart';
import 'package:conferance_app/screens/events/widgets/custom_readmore_text_widget.dart';
import 'package:conferance_app/screens/events/widgets/upcoming_event_card.dart';
import 'package:conferance_app/screens/home/widgers/custom_svg_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Event Details',
          style: TextStyle(
            letterSpacing: 2,
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [SvgPicture.asset('assets/svg/live_svg.svg')],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        height: 1.sh,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 215.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1573164574572-cb89e39749b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fG1lZXRpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.r)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '4th Internationals Engineering Conference Deans',
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18.sp),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.bookmark_outline,
                      size: 30.sp,
                    ),
                    Icon(
                      Icons.share_outlined,
                      size: 30.sp,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            _customIconWIthText(
                iconData: Icons.calendar_month,
                titleText: '18 March, 2021',
                subTitle: '8:00am : 6pm'),
            _customIconWIthText(
                iconData: Icons.place,
                titleText: 'Pearl Continental',
                subTitle: 'Opposite to PIDC'),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'About this event',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ExpandableText(
              'Maecenas faucibus mollis interdum. Nullam quis risus eget urna mollis ornare vel eu leo, lenean eli lacinia bibendum nulla sed consectetur quis risus eget urna urna mollis ornare vel eu leo.. read more',
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                _imageCircle(),
                SizedBox(
                  width: 5.w,
                ),
                _imageCircle(),
                SizedBox(
                  width: 5.w,
                ),
                _imageCircle(),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  '+92 Are Going',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 11.sp),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Event Days and Dates',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            // Container(
            //   height: 100.h,
            //   child: CalendarTimeline(
            //     showYears: true,
            //     initialDate: DateTime.now(),
            //     firstDate: DateTime.now(),
            //     lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
            //     onDateSelected: (date) => DateTime.now(),
            //     leftMargin: 20,
            //     monthColor: Colors.white70,
            //     dayColor: Colors.teal[200],
            //     dayNameColor: const Color(0xFF333A47),
            //     activeDayColor: Colors.white,
            //     activeBackgroundDayColor: Colors.redAccent[100],
            //     dotsColor: const Color(0xFF333A47),
            //     selectableDayPredicate: (date) => date.day != 23,
            //     locale: 'en',
            //   ),
            // ),
            CustomExpandableTile(),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageStack(),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  '+92 Are Going',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomSvgIconButton(
                  backgroundColor: Color(0xffFB0201),
                  svgIcon: 'assets/svg/play_svg_icon.svg',
                ),
              ],
            )
          ],
        )),
      ),
    );
  }

  _imageCircle() {
    return CircleAvatar(
      backgroundImage: NetworkImage(
          'https://images.unsplash.com/photo-1577415124269-fc1140a69e91?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fG1lZXRpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'),
      radius: 20.r,
    );
  }

  _customIconWIthText(
      {required String titleText,
      required String subTitle,
      required IconData iconData}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppConstants.CONSTANT_COLOR,
            shape: BoxShape.rectangle),
        padding: EdgeInsets.all(15.sp),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
      title: Text(
        titleText,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: AppConstants.CONSTANT_COLOR),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
