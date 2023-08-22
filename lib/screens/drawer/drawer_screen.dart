import 'package:conferance_app/constants/app_constant.dart';
import 'package:conferance_app/screens/drawer/widgets/drawer_profile_details_widget.dart';
import 'package:conferance_app/screens/drawer/widgets/drawertile.dart';
import 'package:conferance_app/screens/sponsers/sponsers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawerScreen extends StatelessWidget {
  const CustomDrawerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 20.r,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          )))),
            ),
            Container(
                padding: EdgeInsets.all(10),
                height: 200.h,
                decoration: BoxDecoration(),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      DrawerProfileWidget(),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                )),
            Divider(
              color: Colors.black,
            ),
            CustomDrawerTile(
              text: 'Live Event',
              svgImgPath: 'assets/svg/drawer_icon1.svg',
            ),
            CustomDrawerTile(
              onpress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SponserScreen()));
              },
              text: 'Sponsors',
              svgImgPath: 'assets/svg/drawer_icon2.svg',
            ),
            CustomDrawerTile(
              text: 'Gallery',
              svgImgPath: 'assets/svg/image_svg_icon.svg',
            ),
            CustomDrawerTile(
              text: 'Events',
              svgImgPath: 'assets/svg/drawer_icon4.svg',
            ),
            CustomDrawerTile(
              text: 'About',
              svgImgPath: 'assets/svg/drawer_icon5.svg',
            ),
            CustomDrawerTile(
              text: 'Logout',
              svgImgPath: 'assets/svg/drawer_icon6.svg',
            ),
          ],
        ),
      ),
    );
  }
}
