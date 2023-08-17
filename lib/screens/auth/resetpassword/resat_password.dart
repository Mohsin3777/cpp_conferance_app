import 'package:conferance_app/screens/auth/resetpassword/change_password.dart';
import 'package:conferance_app/screens/home/mainscreen.dart';
import 'package:conferance_app/utils/text_field_decoration.dart';
import 'package:conferance_app/widgets/auth_related_heading.dart';
import 'package:conferance_app/widgets/custom_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  var margin = EdgeInsets.symmetric(vertical: 5, horizontal: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Container(
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: margin,
              child: const AuthRelatedHeaderHeadings(
                text: 'Change Password',
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              margin: margin,
              child: Text(
                'Enter your email address',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
                // textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              margin: margin,
              child: Text(
                'to reset password',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
                // textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              margin: margin,
              child: TextFormField(
                  decoration: TextFeildDecorationClass.inputDecoration(context,
                      hintText: 'abc@gmail.com',
                      prefixIcon: const Icon(Icons.email))),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              alignment: Alignment.center,
              margin: margin,
              child: CustomLoadingButton(
                text: "Next",
                height: 60.h,
                width: 300.w,
                borderRadius: 30.r,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                condition: false,
                isLoading: false,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: Container(
                width: 1.sw,
                child: Image(
                  image: AssetImage('assets/images/curve1.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
