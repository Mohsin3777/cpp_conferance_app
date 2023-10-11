import 'package:conferance_app/constants/app_constant.dart';
import 'package:conferance_app/screens/auth/resetpassword/resat_password.dart';
import 'package:conferance_app/services/http_services/auth_services/auth_services.dart';
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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isLogin = false;
  final _signinFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signInFormField();
  }

  void signInFormField() {
    emailController.text = "mohsin@jjj11.com";
    passwordController.text = '123';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _signinFormKey,
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
              controller: emailController,
              decoration: TextFeildDecorationClass.inputDecoration(context,
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.mail_outline_outlined,
                    size: 25.sp,
                  )),
            ),
            spaceBtweenWidget,
            TextFormField(
              controller: passwordController,
              decoration: TextFeildDecorationClass.inputDecoration(context,
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 25.sp,
                  )),
              // validator: ((value) {
              //   if (value != null && value != '') {
              //     return 'enter some value';
              //   }
              // }),
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
            ),ElevatedButton(onPressed: ()async{
               AuthServices _authServices = AuthServices();
            await   _authServices.getUserData(context: context);
            }, child: Text('aa')),
            //forget password row end
            spaceBtweenWidget,
            CustomLoadingButton(
              text: "Log In",
              height: 60.h,
              width: 280.w,
              borderRadius: 30.r,
              color: Colors.white,
              textColor: AppConstants.CONSTANT_COLOR,
              condition: isLogin,
              isLoading: isLoading,
              onPressed: () async {
             
                if (_signinFormKey.currentState!.validate()) {
                  _signinFormKey.currentState!.save();
                  setState(() {
                    isLoading = true;
                    isLogin = true;
                  });
                  try {
                    AuthServices _authServices = AuthServices();
                    int status = await _authServices.signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                 print(status.toString() +'+++++++++++');
                    if (status == 200) {

     
                      // setState(() {
                      //   isLoading = false;
                      //   isLogin = false;
                        
                      // });
      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CustomBottomNavigationBar()));
                
                    } else {
                      setState(() {
                        isLoading = false;
                        isLogin = false;
                      });
                      const SnackBar(content: Text('Invalid Credentials'));
                    }
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                      isLogin = false;
                    });
                    SnackBar(content: Text(e.toString()));
                  }
                }

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => CustomBottomNavigationBar()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
