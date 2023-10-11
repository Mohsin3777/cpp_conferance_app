import 'package:flutter/material.dart';

class Dialog11 extends StatelessWidget {
  const Dialog11({super.key});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
        content: Container(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter time'
                ),
              ),
              SizedBox(height: 20,),
                 TextField(
                decoration: InputDecoration(
                  hintText: 'Enter description'
                ),
              ),
            ],
          ),
        ),
      );
  }
}