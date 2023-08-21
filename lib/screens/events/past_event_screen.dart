import 'package:conferance_app/screens/events/widgets/upcoming_event_text_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/upcoming_event_card.dart';

class PastEventScreen extends StatelessWidget {
  const PastEventScreen({super.key});

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
