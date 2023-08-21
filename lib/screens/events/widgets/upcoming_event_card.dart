import 'package:conferance_app/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomUpcomingEvent extends StatelessWidget {
  final bool? isBookmarked;
  const CustomUpcomingEvent({
    Key? key,
    this.isBookmarked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      // height: 170.h,
      color: Colors.white,
      child: Row(
        children: [
          _cardImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            // width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '18 March, 2021',
                      style: TextStyle(
                        color: AppConstants.CONSTANT_COLOR,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    isBookmarked == true
                        ? Icon(Icons.bookmark)
                        : Icon(Icons.bookmark_outline)
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Magical Writer 2021',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                      maxLines: 3,
                    ),
                    Icon(Icons.more_vert)
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/home_card_location_svg.svg',
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Pearl Continental',
                      style: TextStyle(
                        color: AppConstants.CONSTANT_COLOR,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    ImageStack(),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      '10+ Going',
                      style: TextStyle(
                        color: AppConstants.CONSTANT_COLOR,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _cardImage({required String imageUrl}) {
    return Container(
      height: 170.h,
      width: 132.w,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(25.r)),
    );
  }
}

class ImageStack extends StatelessWidget {
  List? imagesList;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
          // padding: const EdgeInsets.all(8.0),
          height: 40.0.h,
          width: 80.0.w,
          // alignment: FractionalOffset.center,
          child: Stack(
            //alignment:new Alignment(x, y)
            children: <Widget>[
              _imageCircle(),
              _imageCircle(leftSpace: 20.r),
              _imageCircle(leftSpace: 40.r),
            ],
          )),
    );
  }

  _imageCircle({double? leftSpace}) {
    return Positioned(
        left: leftSpace ?? 0,
        child: CircleAvatar(
          radius: 20.r,
          backgroundImage: NetworkImage(
              'https://plus.unsplash.com/premium_photo-1669703777437-27602d656c27?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60'),
        ));
  }
}
