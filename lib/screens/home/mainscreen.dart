import 'package:conferance_app/constants/app_constant.dart';
import 'package:conferance_app/screens/commitee_members/commitee_member_screen.dart';
import 'package:conferance_app/screens/drawer/drawer_screen.dart';
import 'package:conferance_app/screens/gallery/gallery_screen.dart';
import 'package:conferance_app/screens/home/widgers/customImage_slider.dart';
import 'package:conferance_app/screens/home/widgers/custom_home_screen_card.dart';
import 'package:conferance_app/screens/home/widgers/custom_svg_icon_button.dart';
import 'package:conferance_app/screens/notification/notification_screen.dart';
import 'package:conferance_app/screens/sponsers/sponsers_screen.dart';
import 'package:conferance_app/utils/screentype.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/text_field_decoration.dart';
import 'package:badges/badges.dart' as badges;

class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawerScreen(),
      body: Container(
        color: AppConstants.CONSTANT_COLOR,
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppConstants.CONSTANT_COLOR,
                    image: DecorationImage(
                        image: AssetImage('assets/images/home_image.png'),
                        alignment: Alignment.topRight)),
                // height: 370.h,
                height: 350.h,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.h, vertical: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return NotifcationScreen();
                              }));
                            },
                            child: Container(
                              child: badges.Badge(
                                position: badges.BadgePosition.custom(
                                  bottom: 0,
                                  top: 10,
                                  end: 1,
                                ),
                                badgeContent: const Text(''),
                                child: Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome,',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'JOHN DOE,',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    // fontSize: 30.sp,
                                    fontSize: 27.sp),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30.r),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDd8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'),
                                  fit: BoxFit.fill,
                                )),
                            width: 80.w,
                            height: 80.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: TextFormField(
                        decoration:
                            TextFeildDecorationClass.inputDecoration(context,
                                hintText: 'Search Event',
                                padding: 16.h,
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                  size: 30.h,
                                )),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        CustomSvgIconButton(
                          title: 'Live Event',
                          backgroundColor: Color(0xff5ED600),
                          svgIcon: 'assets/svg/play_svg_icon.svg',
                        ),
                        CustomSvgIconButton(
                          title: 'Pictures',
                          backgroundColor: Color(0xffFDAE39),
                          svgIcon: 'assets/svg/image_svg_icon.svg',
                          onpress: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return GalleryHomeScreen();
                            }));
                          },
                        ),
                        CustomSvgIconButton(
                          title: 'Sponsor',
                          backgroundColor: Color(0xff959EED),
                          svgIcon: 'assets/svg/handshake_svg_icon.svg',
                          onpress: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SponserScreen();
                            }));
                          },
                        ),
                        CustomSvgIconButton(
                          title: 'Committee',
                          onpress: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CommiteeMemberScreen();
                            }));
                          },
                          backgroundColor: Colors.red,
                          svgIcon: 'assets/svg/handshake_svg_icon.svg',
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 300.h,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r))),
                child: CustomImageSlider(),
              ),
              Container(
                height: 20.h,
                color: Colors.white,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Events',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14.sp),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          color: AppConstants.CONSTANT_COLOR,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: 10.h,
              ),
              Container(
                color: Colors.white,
                height: 600.h,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CustomHomeScreenCard(
                        Screentype: ScreenName.home.toString(),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
