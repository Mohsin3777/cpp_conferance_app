import 'package:conferance_app/constants/app_constant.dart';
import 'package:conferance_app/screens/auth/login/widget/login_form.dart';
import 'package:conferance_app/screens/auth/resetpassword/resat_password.dart';
import 'package:conferance_app/utils/text_field_decoration.dart';
import 'package:conferance_app/widgets/custom_loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  var spaceBtweenWidget = SizedBox(height: 20.h);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 1.sh,
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
              Expanded(
                child: Container(
                  height: 600.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33.r),
                    color: AppConstants.CONSTANT_COLOR,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SingleChildScrollView(child: LoginForm()),
                      Spacer(),
                      _customBottomText(
                        normalText: 'Doesn’t have an account? ',
                        highlightedText: 'Register Here',
                        onpress: () {
                     
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  _customBottomText(
      {String? normalText,
      String? highlightedText,
      required VoidCallback onpress}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          normalText!,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
        InkWell(
          onTap: onpress,
          child: Text(
            highlightedText!,
            style: TextStyle(
                // fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
