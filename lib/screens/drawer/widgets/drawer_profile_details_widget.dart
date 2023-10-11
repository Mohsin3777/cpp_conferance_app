import 'package:conferance_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constant.dart';

class DrawerProfileWidget extends StatelessWidget {
  const DrawerProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<AuthProvider>(builder: (context, value, child) {return FittedBox(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    image: DecorationImage(
                      image: NetworkImage(
                value.userModel.profilePic ??          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDd8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'),
                      fit: BoxFit.fill,
                    )),
                width: 100.w,
                height: 100.h,
              ),
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child:   
   Text(value.userModel.name.toString())
   ),
             
              SizedBox(
                height: 6.h,
              ),
              Text(
                value.userModel.email.toString(),
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff222222)),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                '11111111',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff222222)),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: AppConstants.CONSTANT_COLOR,
                      borderRadius: BorderRadius.circular(30.r)),
                  width: 94.w,
                  height: 30.h,
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ));
    });

  }
}
