import 'package:conferance_app/practice/dialog.dart';
import 'package:conferance_app/practice/practice_event_model.dart';
import 'package:conferance_app/services/http_services/event_services/event_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddScheduleScreen extends StatefulWidget {
  const AddScheduleScreen({super.key});

  @override
  State<AddScheduleScreen> createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends State<AddScheduleScreen> {
  PracticeEventModel? practiceEventModel = PracticeEventModel();

  List<DaySchedule>? daysScheduleList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      try {
        getData();
      } catch (e) {
        SnackBar(content: Text(e.toString()));
      }
    });
  }

  getData() async {
    practiceEventModel = await EventServices.getSingleEventWithId();

    daysScheduleList = practiceEventModel!.data!.daySchedule!;

    print(practiceEventModel!.data!.dateOfEvent);
  }

// String? id;
// String? description;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Schedule'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        PracticeEventModel practiceEventModel1 =
            PracticeEventModel.fromJson(practiceEventModel!.toJson());
        Future.delayed(Duration(seconds: 1), () {
          EventServices.addScheduleInEvent(
              practiceEventModel1.data!.daySchedule);
        });
      }),
      body: Container(
        height: 1.sh,
        width: 1.sw,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(practiceEventModel!
                                    .data!.daySchedule![index].date
                                    .toString()),
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
                                          builder: (context) =>
                                              _alertDialog(index));
                                    },
                                    child: Text('ADD')),
                              ],
                            ),
                            Container(
                              height: 300.h,
                              width: 1.sw,
                              child: ListView.builder(
                                  itemCount: practiceEventModel!.data!
                                      .daySchedule![index].schedule!.length,
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
                                            practiceEventModel!.data!
                                                .daySchedule![index].schedule!
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
  }
}
