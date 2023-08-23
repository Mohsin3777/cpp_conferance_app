import 'package:conferance_app/constants/app_constant.dart';
import 'package:conferance_app/screens/auth/resetpassword/resat_password.dart';
import 'package:conferance_app/utils/text_field_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/custom_loading_button.dart';
import '../../../bottombar/custom_bottom_bar.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var spaceBtweenWidget = SizedBox(height: 20.h);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600),
          ),
          spaceBtweenWidget,
          TextFormField(
            decoration: TextFeildDecorationClass.inputDecoration(context,
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.mail_outline_outlined,
                  size: 25.sp,
                )),
          ),
          spaceBtweenWidget,
          TextFormField(
            decoration: TextFeildDecorationClass.inputDecoration(context,
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  size: 25.sp,
                )),
          ),
          SizedBox(height: 10.h),
          // forget password row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const ResetPasswordWithEmail()));
                },
                child: Text(
                  'Forget Your Password?',
                  style: TextStyle(fontSize: 15.sp, color: Colors.white),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Remember Me',
                    style: TextStyle(fontSize: 15.sp, color: Colors.white),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: FittedBox(
                      child: CupertinoSwitch(
                        value: true,
                        onChanged: (value) {
                          // swithState = value;
                          // setState(
                          //   () {},
                          // );
                        },
                        thumbColor: AppConstants.CONSTANT_COLOR,
                        activeColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          //forget password row end
          spaceBtweenWidget,
          CustomLoadingButton(
            text: "Log In",
            height: 60.h,
            width: 280.w,
            borderRadius: 30.r,
            color: Colors.white,
            textColor: AppConstants.CONSTANT_COLOR,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomBottomNavigationBar()));
            },
            condition: false,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
