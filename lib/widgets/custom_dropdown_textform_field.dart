// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conferance_app/utils/text_field_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//

class CustomDropDownTextFormField extends StatelessWidget {
  final dropDownList;
  final dropDownValue;
  // final Function(String val) onpress;
  Function(String? val)? onpress;
  CustomDropDownTextFormField(
      {super.key,
      this.dropDownList,
      this.dropDownValue,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      menuMaxHeight: 250.h,
      // value: widget.dropDownList[0],
      value: dropDownValue,
      icon: Icon(
        Icons.arrow_drop_down_outlined,
        size: 30.sp,
      ),
      // widget.dropDownList
      decoration:
          TextFeildDecorationClass.inputDecoration(context, hintText: ''),
      items: dropDownList.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onpress,
    );
  }
}
