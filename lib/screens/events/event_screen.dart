// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conferance_app/screens/events/allevent_screen.dart';
import 'package:conferance_app/screens/events/past_event_screen.dart';
import 'package:conferance_app/screens/events/saved_event_screen.dart';
import 'package:conferance_app/screens/events/upcoming_event_screen.dart';
import 'package:conferance_app/screens/events/widgets/custom_event_heading.dart';
import 'package:conferance_app/screens/events/widgets/upcoming_event_card.dart';
import 'package:conferance_app/screens/events/widgets/upcoming_event_text_row.dart';
import 'package:conferance_app/screens/home/widgers/custom_home_screen_card.dart';
import 'package:conferance_app/screens/home/widgers/customtabbar.dart';
import 'package:conferance_app/utils/screentype.dart';
import 'package:conferance_app/widgets/custom_notification_with_dot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:conferance_app/constants/app_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/custom_appbar.dart';

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
    tabController = TabController(length: 4, vsync: this);
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
      appBar: CustomAppbar(
        title: 'Sponser',
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
                CustomEventTab(
                  tabController: tabController,
                  tabText: 'All Events',
                ),
                CustomEventTab(
                  tabController: tabController,
                  tabText: 'Upcoming',
                ),
                CustomEventTab(
                  tabController: tabController,
                  tabText: 'Past',
                ),
                CustomEventTab(
                  tabController: tabController,
                  tabText: 'Saved',
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              // height: 200,
              child: TabBarView(controller: tabController, children: [
                // EventScreen(),
                // Center(child: Text('22')),
                AllEventScreen(),
                UpComingEventScreen(),
                PastEventScreen(),

                SavedEventScreen(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
