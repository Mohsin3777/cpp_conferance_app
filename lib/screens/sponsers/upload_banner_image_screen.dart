import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/custom_loading_button.dart';

class UploadBannerScreen extends StatefulWidget {
  const UploadBannerScreen({super.key});

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  File? _pickedImage;

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          _pickedImage == null
              ? Text('No image selected')
              : Image.file(_pickedImage!),
          ElevatedButton(
            onPressed: _pickImageFromGallery,
            child: Text('Pick Image from Gallery'),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Add Details',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.black,
                  letterSpacing: 2),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upload Image',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Colors.black,
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // Container(
                //   width: 1.sw,
                //   height: 200.h,
                //   child: DottedBorder(
                //     color: Color(0xffB3B3B3), //color of dotted/dash line
                //     strokeWidth: 3, //thickness of dash/dots
                //     dashPattern: [10, 6],
                //     child: Container(
                //         width: 1.sw,
                //         alignment: Alignment.center,
                //         color: Color(0xffB3B3B3),
                //         // decoration: BoxDecoration(border: Border.all()),

                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Icon(
                //               Icons.upload_file_outlined,
                //               size: 50.sp,
                //             ),
                //             SizedBox(
                //               height: 10.h,
                //             ),
                //             Text('Upload Image')
                //           ],
                //         )),
                //   ),
                // ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Ad Description',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Colors.black,
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(10.r)),
                  // height: 200.h,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 100.0.h),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomLoadingButton(
                  height: 60.h,
                  width: 1.sw,
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => BecomeASponserScreen()));
                  },
                  borderRadius: 10.r,
                  condition: false,
                  text: 'Apply',
                  isLoading: false,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
