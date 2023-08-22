import 'package:conferance_app/screens/sponsers/register_sponser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRegisterSponserCard extends StatelessWidget {
  const CustomRegisterSponserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 700.h,
      // width: 0.8.sw,
      // decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          Container(
            // decoration:
            //     BoxDecoration(border: Border.all(color: Colors.green)),
            child: Card(
              child: Container(
                // height: 0.6.sh,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Column(
                  children: [
                    StackWidget(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      // decoration: BoxDecoration(color: Colors.red),
                      height: 250.h,
                      child: SingleChildScrollView(
                        child: Column(
                          children:
                              List.generate(10, (index) => _custom_TextTile()),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _customSponcerCardButton(
                        colorList: [
                          Color(0xffFED700),
                          Color(0xffFF9D0A),
                          Color(0xffFF9D0A)
                        ],
                        width: 200.w,
                        height: 55.h,
                        onpress: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegisterSponser();
                          }));
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _custom_TextTile({String? text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check,
            color: Color(0xff5ED600),
          ),
          SizedBox(
            width: 5.w,
          ),
          Flexible(
            child: Text(
              text ??
                  'ponsor’s logo on the confadddddddddddddddddddddderence webpage(s) & on social media',
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  _customSponcerCardButton(
      {VoidCallback? onpress,
      String? buttonText,
      List<Color>? colorList,
      double? width,
      double? height}) {
    return InkWell(
      onTap: onpress,
      child: Container(
          alignment: Alignment.center,
          height: height ?? 40,
          width: width ?? 116.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colorList ??
                  [Color(0xff029899), Color(0xff31AC8B), Color(0xff61C17C)],
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            buttonText ?? 'View Event',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 2),
          )),
    );
  }
}

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.r),
                topRight: Radius.circular(18.r)),
            gradient: LinearGradient(colors: [
              Color(0xffFED700),
              Color(0xffFF9D0A),
            ]),
          ),
          height: 146.h,
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                'Gold Sponsor',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 21.sp,
                    letterSpacing: 2,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '10,00,000',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 21.sp,
                    letterSpacing: 2,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
        Positioned(
          top: -30.h,
          left: 0,
          right: 0,
          child: Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
                color: Colors.white,
                // gradient: LinearGradient(colors: [
                //   // Color(0xffFED700),
                //   // Color(0xffFF9D0A),
                //   // Color(0xffFF9D0A)
                // ]),
                border: Border.all(
                  width: 10.w,
                  color: Color(0xffFF9D0A),
                ),
                shape: BoxShape.circle),
            child: Image(
                image: AssetImage('assets/images/sponser_crown_image.png')),
          ),
        )
      ],
    );
  }
}
