import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSponcerCard extends StatelessWidget {
  const CustomSponcerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          // color: Color.fromARGB(255, 15, 15, 15),
          borderRadius: BorderRadius.circular(15)),
      child: FittedBox(
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1563694983011-6f4d90358083?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGxvZ298ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'),
              fit: BoxFit.cover,
              height: 100.h,
              width: 100.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'MOHSIN IRFAN',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
            )
          ],
        ),
      ),
    );
  }
}
