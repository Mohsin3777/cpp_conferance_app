import 'package:conferance_app/screens/sponsers/widgets/custom_sponser_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_notification_with_dot.dart';
import '../events/widgets/custom_event_heading.dart';
import '../home/widgers/customImage_slider.dart';

class SponserScreen extends StatelessWidget {
  const SponserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {},
        ),
        title: Text(
          'Our Sponsors',
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
            Container(
                height: 300.h,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r))),
                child: CustomImageSlider()),
            SizedBox(
              height: 20.h,
            ),
            CustomEventScreenHeading(text: 'Todays Events'),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                // implement GridView.builder
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150.h,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2),
                    itemCount: 10,
                    itemBuilder: (BuildContext ctx, index) {
                      return CustomSponcerCard();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
