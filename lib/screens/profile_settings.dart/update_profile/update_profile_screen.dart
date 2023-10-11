import 'dart:convert';
import 'dart:io';

import 'package:conferance_app/providers/auth_provider.dart';
import 'package:conferance_app/screens/events/event_screen.dart';
import 'package:conferance_app/utils/text_field_decoration.dart';
import 'package:conferance_app/widgets/custom_loading_button.dart';
import 'package:conferance_app/widgets/custom_notification_with_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constant.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  TextEditingController nameController= TextEditingController();
  TextEditingController phoneController = TextEditingController();

  
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
 uploadImage(File image) async {
    var bytes = await rootBundle.load(_pickedImage!.path);
    var buffer = bytes.buffer;
    var imageBytes =
        buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    var base64Image = base64Encode(imageBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppConstants.CONSTANT_COLOR,
        elevation: 0,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              )),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        child: Consumer<AuthProvider>(

          builder: (context, val,child) {
              nameController.text =val.userModel.name!;
           
              
            return Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration:
                              BoxDecoration(color: AppConstants.CONSTANT_COLOR),
                          height: 110.h,
                          width: 1.sw,
                        ),
                        Positioned(
                            left: 0, right: 0, bottom: -60.h, child: _imageCircle(

image: _pickedImage,
                              onTap: ()async{
                               await _pickImageFromGallery();
                              }
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 90.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      child: TextFormField(
                        controller: nameController,
                        decoration: TextFeildDecorationClass.inputDecoration(context,
                            hintText: 'Full Name',
                            prefixIcon: Icon(Icons.person_outline)),
                            onChanged: (v){
                             val.updateUserModel(v);
                              val.userModel.name!=val;
                            },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      child: TextFormField(
                        enabled: false,
                        decoration: TextFeildDecorationClass.inputDecoration(context,
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined)),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      child: TextFormField(
                        enabled: false,
                        decoration: TextFeildDecorationClass.inputDecoration(context,
                            hintText: 'Phone',
                            prefixIcon: Icon(Icons.phone_outlined)),
                      ),
                    ),
                          SizedBox(
                      height: 20.h,
                    ),
              
                    CustomLoadingButton(text: 'Update', borderRadius: 20.r, height: 60.h, width: 0.8.sw, condition: val.isLoading,
              isLoading: val.isLoading,
                    
                    onPressed: (){
                  // if(_pickedImage!.path==''&& _pickedImage!.path.isEmpty  &&  _pickedImage ==null){
                  //       val.updateUser(context, val.userModel,'');
                  // }else{
                      
                  // }
 
                  if(_pickedImage !=null){
  val.updateUser(context, val.userModel,_pickedImage!.path.toString());
                  }else{
                           val.updateUser(context,val.userModel,'');
                  }
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> EventScreen()));
                    },
                    )                ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  _imageCircle({File? image, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120.h,
        width: 120.w,
        decoration: BoxDecoration(
          border: Border.all(width: 5.h, color: Colors.white),
          shape: BoxShape.circle,
        ),
        child: FittedBox(
          // child: CircleAvatar(
          //     backgroundImage:   NetworkImage(
          //         'https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDR8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60')
                  
            
          //         ),
          child: Container(
            height: 70.h,
            clipBehavior: Clip.antiAlias,
            width: 70.w,
            decoration: BoxDecoration(shape: BoxShape.circle,),
            child: image ==null ?
   Image(image:          NetworkImage(
              'https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?ixlib=rb-4.0.3&ixid=M3wxMjA'),      fit: BoxFit.cover,)
            :      Image.file(
                              _pickedImage!,
                              fit: BoxFit.cover,
                            ),
          ),
        ),
      ),
    );
  }
}
