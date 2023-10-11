import 'package:conferance_app/screens/sponsers/upload_banner_image_screen.dart';
import 'package:conferance_app/utils/text_field_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_loading_button.dart';

class RegisterSponser extends StatefulWidget {
  const RegisterSponser({super.key});

  @override
  State<RegisterSponser> createState() => _RegisterSponserState();
}

class _RegisterSponserState extends State<RegisterSponser> {
  final space = SizedBox(height: 15.h);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Register Now',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                decoration: TextFeildDecorationClass.inputDecoration(context,
                    hintText: 'Full Name', prefixIcon: Icon(Icons.person)),
              ),
              space,
              TextFormField(
                decoration: TextFeildDecorationClass.inputDecoration(context,
                    hintText: 'Email', prefixIcon: Icon(Icons.email)),
              ),
              space,
              TextFormField(
                decoration: TextFeildDecorationClass.inputDecoration(context,
                    hintText: 'phone no', prefixIcon: Icon(Icons.phone)),
              ),
              space,
              TextFormField(
                decoration: TextFeildDecorationClass.inputDecoration(context,
                    hintText: 'Address', prefixIcon: Icon(Icons.place)),
              ),
              space,
              TextFormField(
                decoration: TextFeildDecorationClass.inputDecoration(context,
                    hintText: 'City', prefixIcon: Icon(Icons.earbuds)),
              ),
              space,
              TextFormField(
                decoration: TextFeildDecorationClass.inputDecoration(context,
                    hintText: 'Country', prefixIcon: Icon(Icons.place_sharp)),
              ),
              space,
              TextFormField(
                decoration: TextFeildDecorationClass.inputDecoration(context,
                    hintText: 'State', prefixIcon: Icon(Icons.work_outlined)),
              ),
              space,
              TextFormField(
                decoration: TextFeildDecorationClass.inputDecoration(context,
                    hintText: 'Zip code',
                    prefixIcon: Icon(Icons.email_rounded)),
              ),
              space,
              TextFormField(
                decoration: TextFeildDecorationClass.inputDecoration(context,
                    hintText: 'Sponser Package',
                    prefixIcon: Icon(Icons.handshake)),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomLoadingButton(
                height: 60.h,
                width: 1.sw,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UploadBannerScreen()));
                },
                borderRadius: 10.r,
                condition: false,
                text: 'Register',
                isLoading: false,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
