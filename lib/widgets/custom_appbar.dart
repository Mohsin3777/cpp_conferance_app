import 'package:conferance_app/widgets/custom_notification_with_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const CustomAppbar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(65.0.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: BackButton(
        color: Colors.black,
        onPressed: () {
          // Navigator.pop(context);
        },
      ),
      title: Text(
        title!,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18.sp),
      ),
      centerTitle: true,
      actions: [
        NotificationIconWithDot(
          iconColor: Colors.black,
        ),
        SizedBox(
          width: 10.w,
        ),
      ],
    );
  }
}
