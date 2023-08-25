import 'package:carousel_slider/carousel_slider.dart';
import 'package:conferance_app/screens/sponsers/widgets/custom_big_sponer_feature_card.dart';
import 'package:conferance_app/widgets/custom_appbar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_notification_with_dot.dart';

class BecomeASponserScreen extends StatefulWidget {
  const BecomeASponserScreen({super.key});

  @override
  State<BecomeASponserScreen> createState() => _BecomeASponserScreenState();
}

class _BecomeASponserScreenState extends State<BecomeASponserScreen> {
  int currentIndex = 0;
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
          'Become a Sponsor',
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
      // appBar: CustomAppbar(
      //   title: ,
      // ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 650.h,
                child: CarouselSlider(
                    items: List.generate(10, (index) {
                      return CustomRegisterSponserCard();
                    }),
                    options: CarouselOptions(
                      height: 680.h,
                      // height: 1.sh,
                      clipBehavior: Clip.none,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    )),
              ),
              DotsIndicator(
                // dotsCount: images.length,
                dotsCount: 10,
                position: currentIndex.toDouble(),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
