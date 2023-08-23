import 'package:conferance_app/constants/app_constant.dart';
import 'package:conferance_app/screens/auth/resetpassword/change_password.dart';
import 'package:conferance_app/screens/profile_settings.dart/update_profile/update_profile_screen.dart';
import 'package:conferance_app/widgets/custom_notification_with_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.CONSTANT_COLOR,
        elevation: 0,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          SvgPicture.asset('assets/svg/play_svg_icon.svg'),
          SizedBox(
            width: 5.w,
          ),
          NotificationIconWithDot(
            iconColor: Colors.white,
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(color: AppConstants.CONSTANT_COLOR),
                    height: 110.h,
                    width: 1.sw,
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: -60.h,
                      child: Container(
                        height: 120.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                            border: Border.all(width: 5.h, color: Colors.white),
                            shape: BoxShape.circle,
                            color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDR8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60'),
                                fit: BoxFit.cover)),
                      ))
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              _textWidget('Name'),
              SizedBox(
                height: 10.h,
              ),
              _textWidget("mmm123@gmail.com"),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.all(15.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'General',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff545454)),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomIconWithText(
                        icon: Icons.person,
                        iconBackgroundColor: Color(0xffFFB905),
                        text: 'Edit Profile',
                        onpress: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return UpdateProfileScreen();
                          }));
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomIconWithText(
                        icon: Icons.lock,
                        iconBackgroundColor: Color(0xff0066FF),
                        text: 'Change Password',
                        onpress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChangePasswordScreen()));
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomIconWithText(
                        icon: Icons.share,
                        iconBackgroundColor: Color(0xffEB00FF),
                        text: 'Share this App',
                        onpress: () {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff545454)),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomIconWithText(
                        icon: Icons.logout_outlined,
                        iconBackgroundColor: Color(0xffFF8A00),
                        text: 'Logout',
                        onpress: () {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  _textWidget(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        letterSpacing: 2,
      ),
    );
  }
}

class CustomIconWithText extends StatelessWidget {
  final String? text;
  final Color? iconBackgroundColor;
  final IconData? icon;
  final VoidCallback? onpress;
  const CustomIconWithText({
    Key? key,
    this.text,
    required this.iconBackgroundColor,
    required this.icon,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress ?? () {},
      child: Row(
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: iconBackgroundColor ?? Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon ?? Icons.person,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            text!,
            style: TextStyle(
                fontSize: 16.sp, fontWeight: FontWeight.w500, letterSpacing: 2),
          )
        ],
      ),
    );
  }
}
