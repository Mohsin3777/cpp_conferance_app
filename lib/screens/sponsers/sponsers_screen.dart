import 'package:conferance_app/screens/sponsers/become_a_sponser_screen.dart';
import 'package:conferance_app/screens/sponsers/widgets/custom_sponser_card.dart';
import 'package:conferance_app/widgets/custom_loading_button.dart';
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
      bottomSheet: Container(
        padding: EdgeInsets.all(10.sp),
        child: CustomLoadingButton(
          height: 60.h,
          width: 1.sw,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BecomeASponserScreen()));
          },
          borderRadius: 10.r,
          condition: false,
          text: 'Become a Sponser',
          isLoading: false,
        ),
      ),
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
                        maxCrossAxisExtent: 200.h,
                        childAspectRatio: 4 / 4,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 10.h),
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
