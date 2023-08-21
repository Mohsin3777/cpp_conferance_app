import 'package:flutter/material.dart';

class CustomExpandableTile extends StatelessWidget {
  const CustomExpandableTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      // backgroundColor: Color(0xffDCFCFC),
      collapsedBackgroundColor: Color(0xffDCFCFC),
      title: Text(
        'Days 1 Schedule',
        style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            color: Color(0xff029899)),
      ),
      children: [
        CustomListTile(
            title: '8:00am : 6pm',
            subtitle: 'String? title , String? subtitle'),
        CustomListTile(
            title: '8:00am : 6pm',
            subtitle: 'String? title , String? subtitle'),
        CustomListTile(
            title: '8:00am : 6pm',
            subtitle: 'String? title , String? subtitle'),
        CustomListTile(
            title: '8:00am : 6pm',
            subtitle: 'String? title , String? subtitle'),
        CustomListTile(
            title: '8:00am : 6pm',
            subtitle: 'String? title , String? subtitle'),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const CustomListTile({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Color(0xffDCFCFC),
      title: Text(
        title ?? '',
        style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xff029899)),
      ),
      subtitle: Text(subtitle ?? ''),
    );
  }
}
