import 'package:conferance_app/providers/event_provider.dart';
import 'package:conferance_app/screens/events/create_event_screen/show_event_prac.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../practice/practice_event_model.dart';
import '../../../services/http_services/event_services/event_services.dart';

class AddDaysScheduleInEventsScreen extends StatefulWidget {
  const AddDaysScheduleInEventsScreen({super.key});

  @override
  State<AddDaysScheduleInEventsScreen> createState() =>
      _AddDaysScheduleInEventsScreenState();
}

class _AddDaysScheduleInEventsScreenState
    extends State<AddDaysScheduleInEventsScreen> {
  PracticeEventModel? practiceEventModel = PracticeEventModel();
  List<DaySchedule>? daysScheduleList = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    final prov = Provider.of<EventProvider>(context, listen: false);

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      try {
        getData(prov.createdEventId);
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

  TextEditingController idController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  _alertDialog(int index) {
    return AlertDialog(
      title: const Text("ALERT"),
      content: SizedBox(
        height: 0.3.sh,
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                hintText: 'Enter time',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(hintText: 'Enter description'),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Schedule? schedule = Schedule(
                      description: descriptionController.text.trim(),
                      time: idController.text.trim());
                  practiceEventModel!.data!.daySchedule![index].schedule!
                      .add(schedule);

                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text('ADD')),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<EventProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Add Days Schedule')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PracticeEventModel practiceEventModel1 =
              PracticeEventModel.fromJson(practiceEventModel!.toJson());
          Future.delayed(Duration(seconds: 1), () async {
            await EventServices.addScheduleInEvent(
                daySchedule: practiceEventModel1.data!.daySchedule,
                id: prov.createdEventId!);

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ShowEvent()));
          });
        },
        child: Icon(Icons.save),
      ),
      body: Consumer<EventProvider>(
        builder: (context, eventProvInstance, child) {
          return Container(
            height: 1.sh,
            width: 1.sw,
            child: Scrollbar(
              radius: Radius.circular(20.r),
              thickness: 10.w,
              trackVisibility: true,
              thumbVisibility: true,
              child: ListView.builder(
                  itemCount: (practiceEventModel!.data == null)
                      ? 0
                      : practiceEventModel!.data!.daySchedule!.length,
                  //  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: () {
                          //       Schedule? schedule = Schedule(
                          //         description: 'AYSSSS',
                          //         time: "8:00"
                          //       );
                          //    practiceEventModel!.data!.daySchedule![index].schedule!.add(schedule);

                          // PracticeEventModel practiceEventModel1 = PracticeEventModel.fromJson(practiceEventModel!.toJson());
                          //     Future.delayed(Duration(seconds: 1),(){

                          //   print(practiceEventModel!.data!.daySchedule![index].schedule![0].time);
                          //       EventServices.addScheduleInEvent(practiceEventModel1.data!.daySchedule );
                          //     });
                        },
                        title: practiceEventModel != null
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(practiceEventModel!
                                              .data!.daySchedule![index].date
                                              .toString() +
                                          ''),
                                      ElevatedButton(
                                          onPressed: () {
                                            //  Schedule? schedule = Schedule(
                                            //       description: 'ZEBTA',
                                            //       time: "9:00"
                                            //     );
                                            //  practiceEventModel!.data!.daySchedule![index].schedule!.add(schedule);

                                            // setState(() {

                                            // });
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return _alertDialog(index);
                                                });
                                          },
                                          child: Text('ADD')),
                                    ],
                                  ),
                                  Container(
                                    height: 300.h,
                                    width: 1.sw,
                                    child: ListView.builder(
                                        itemCount: practiceEventModel!
                                            .data!
                                            .daySchedule![index]
                                            .schedule!
                                            .length,
                                        itemBuilder: (context, ind) {
                                          return ListTile(
                                            title: Text(practiceEventModel!
                                                .data!
                                                .daySchedule![index]
                                                .schedule![ind]
                                                .time
                                                .toString()),
                                            subtitle: Text(practiceEventModel!
                                                .data!
                                                .daySchedule![index]
                                                .schedule![ind]
                                                .description
                                                .toString()),
                                            trailing: IconButton(
                                                onPressed: () {
                                                  practiceEventModel!
                                                      .data!
                                                      .daySchedule![index]
                                                      .schedule!
                                                      .removeAt(ind);
                                                  setState(() {});
                                                },
                                                icon: Icon(Icons.close)),
                                          );
                                        }),
                                  )
                                ],
                              )
                            : Container());
                  }),
            ),
          );
        },
      ),
    );
  }
}
