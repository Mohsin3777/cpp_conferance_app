import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class TimeLineCalenderPractice extends StatefulWidget {
  const TimeLineCalenderPractice({Key? key}) : super(key: key);

  @override
  _TimeLineCalenderPracticeState createState() => _TimeLineCalenderPracticeState();
}

class _TimeLineCalenderPracticeState extends State<TimeLineCalenderPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TIMELINE'),),
      body: Container(
        child: CalendarTimeline(
          initialDate: DateTime(2020, 4, 20),
          firstDate: DateTime(2019, 1, 15),
          lastDate: DateTime(2020, 11, 20),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Colors.teal[200],
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.redAccent[100],
          dotsColor: Color(0xFF333A47),
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ),
      ),
    );
  }
}
