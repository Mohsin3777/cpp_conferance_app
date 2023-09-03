import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthRelatedHeaderHeadings extends StatelessWidget {
  final String? text;
  const AuthRelatedHeaderHeadings({super.key, this.text = ""});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 25, color: Colors.black),
    );
  }
}
