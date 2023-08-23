import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: Text(
          'About',
          style: TextStyle(
              fontSize: 20.h,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Container(
              child: Image(image: AssetImage('assets/images/logo_image.png')),
            ),
            Container(
              child: Image(
                  image: AssetImage('assets/images/login_text_image.png')),
            ),
            SizedBox(
              height: 20.h,
            ),
            _customTile(
                title: '(051) 111 111 732 , (021) 99250216',
                icon: Icons.phone_outlined),
            _customTile(
                title: 'deansconference.matzsolutions.com',
                icon: CupertinoIcons.globe),
            _customTile(
                title: 'deansconference.matzsolutions.com', icon: Icons.mail),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset('assets/svg/facebook_svg.svg'),
                SvgPicture.asset('assets/svg/twitter_svg.svg'),
                SvgPicture.asset('assets/svg/linkedin_svg.svg'),
                SvgPicture.asset('assets/svg/instagram_svg.svg'),
                SvgPicture.asset('assets/svg/youtube_svg.svg'),
              ],
            )
          ],
        ),
      ),
    );
  }

  _customTile({required String title, required IconData icon}) {
    return ListTile(
      leading: Icon(icon, color: Color(0xff262626)),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
            color: Color(0xff262626)),
      ),
    );
  }
}
