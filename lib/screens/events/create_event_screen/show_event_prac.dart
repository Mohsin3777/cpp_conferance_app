import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:conferance_app/practice/practice_event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/event_provider.dart';
import '../../../services/http_services/event_services/event_services.dart';

class ShowEvent extends StatefulWidget {
  const ShowEvent({super.key});

  @override
  State<ShowEvent> createState() => _ShowEventState();
}

class _ShowEventState extends State<ShowEvent> {
  PracticeEventModel? practiceEventModel = PracticeEventModel();
  List<DaySchedule>? daysScheduleList = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    final prov = Provider.of<EventProvider>(context, listen: false);

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      try {
        getData('64f72f917afd62232c2ddf52');
      } catch (e) {
        SnackBar(content: Text(e.toString()));
      }
    });
  }

  //to load data with id
  getData(String? id) async {
    practiceEventModel =
        await EventServices.getSingleEventWithId(id: id, context: context);

    daysScheduleList = practiceEventModel!.data!.daySchedule!;

    print(practiceEventModel!.data!.dateOfEvent);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(practiceEventModel!.data!.dateOfEvent!.length);
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          children: [
            Container(
              height: 200.h,
              child: Image(
                  image: NetworkImage(practiceEventModel!.data!.titleImage ??
                      'https://images.unsplash.com/photo-1682687220866-c856f566f1bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=400&q=60')),
            ),
            Text(practiceEventModel!.data!.title ?? ''),
            // Container(
            //   height: 250.h,
            //   child: Expanded(
            //     child: CalendarTimeline(
            //       showYears: true,
            //       initialDate: DateTime.parse(
            //           practiceEventModel!.data!.dateOfEvent![0].date!),
            //       firstDate: DateTime.now(),
            //       // lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
            //       lastDate: DateTime.now().add(Duration(days: 10)),
            //       onDateSelected: (date) => DateTime.now(),
            //       leftMargin: 20,
            //       monthColor: Colors.white70,
            //       dayColor: Colors.teal[200],
            //       dayNameColor: const Color(0xFF333A47),
            //       activeDayColor: Colors.white,
            //       activeBackgroundDayColor: Colors.redAccent[100],
            //       dotsColor: const Color(0xFF333A47),
            //       selectableDayPredicate: (date) => date.day != 23,
            //       locale: 'en',
            //     ),
            //   ),
            // ),
            Container(
              height: 300.h,
              child: ListView.builder(
                  itemCount: practiceEventModel!.data!.dateOfEvent!.length,
                  itemBuilder: (context, index) {
                    return CustomExpandableTile1(
                      ind: index,
                      practiceEventModel: practiceEventModel!,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomExpandableTile1 extends StatelessWidget {
  final int ind;
  final PracticeEventModel practiceEventModel;
  const CustomExpandableTile1({
    Key? key,
    required this.practiceEventModel,
    required this.ind,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(practiceEventModel.data!.daySchedule!.length);
    return ExpansionTile(
      // backgroundColor: Color(0xffDCFCFC),
      collapsedBackgroundColor: Color(0xffDCFCFC),
      title: Text(
        "${practiceEventModel.data!.dateOfEvent![ind].date}Schedule",
        style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            color: Color(0xff029899)),
      ),
      children: List.generate(
          practiceEventModel.data!.daySchedule![ind].schedule!.length, (index) {
        print(index.toString() + 'aaaaaa');
        return CustomListTile(
          title: practiceEventModel
              .data!.daySchedule![ind].schedule![index].time
              .toString(),
          subtitle: practiceEventModel
              .data!.daySchedule![ind].schedule![index].description
              .toString(),
        );
      }),
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
