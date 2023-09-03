


import 'package:conferance_app/practice/add_schedule.dart';
import 'package:conferance_app/practice/practice_event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';


import '../services/http_services/event_services/event_services.dart';

class AddEventPracticeScreen extends StatefulWidget {
  const AddEventPracticeScreen({super.key});

  @override
  State<AddEventPracticeScreen> createState() => _AddEventPracticeScreenState();
}

class _AddEventPracticeScreenState extends State<AddEventPracticeScreen> {



var uuid = Uuid();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<DateOfEvent> listOfDays = [];
  int noOfdays = 1;
  List<DummyClass> daysSchedule = [
    DummyClass(id: '11',description: 'first'),
       DummyClass(id: '2',description: 'secomnd'),
  ];
  Future<void> startDateFunction(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));


    if (picked != null && picked != startDate) {


  // if (DateUtils.isSameDay(picked, endDate)){
      if (picked.compareTo(endDate) == 0){
  print('same day');
     setState(() {
          startDate = picked;
        });
 
}else{
      if (picked.compareTo(endDate) < 0) {
        print("Start date  is before endDate");

        setState(() {
          startDate =picked;
        });
      }

          if (picked.compareTo(endDate) > 0) {
        print("Start date  is after endDate");
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Start date  is after endDate')));
        setState(() {
          startDate =DateTime.now();
        });
      }
}


    


 
    }
  }

  Future<void> endDateFunction(
    BuildContext context,
  ) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: endDate,
           firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != endDate) {
      if (DateUtils.isSameDay(picked, startDate)){
         setState(() {
          endDate = picked;
        });
   print('same day');
}else{
  if (startDate.compareTo(endDate) < 0) {
        print("DT1 is before DT2");

        setState(() {
          endDate = picked;
        });

        Duration diff = endDate.difference(startDate);
        // getDaysInBetween(startDate,endDate);

        setState(() {
          noOfdays = diff.inDays;
          print(noOfdays);
        });
      }

      if (startDate.compareTo(endDate) > 0) {
        print("DT1 is after DT2");

        setState(() {
          endDate = DateTime.now();
        });
      }
}


      

  
    }
  }


List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {


  List<DateTime> days = [];

    if (startDate.compareTo(endDate) == 0){
      listOfDays=[];
days.add(startDate);

listOfDays.add(DateOfEvent(date: days[0].toString().split(' ')[0],
dateOfEventId: uuid.v1()
));

    }else{
        for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
listOfDays=[];
  days.forEach((day) {
    // print(day.toString().split(' ')[0]);
listOfDays.add(DateOfEvent(date: day.toString().split(' ')[0],
dateOfEventId: uuid.v1()
));

  });
    }





  // print(listOfDays[0]);
  return days;
}
  TextEditingController idController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  addintoList(String id, String description) {
    DummyClass dummyClass = DummyClass(id: id, description: description);

    daysSchedule.add(dummyClass);
    setState(() {});
  }

  _displayDialog(BuildContext context,
      {String? id, String? description, int? index}) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ADD TASK'),
            content: Column(
              children: [
                TextFormField(
                  controller: idController..text = id ?? '',
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(hintText: "Enter your number"),
                ),
                TextFormField(
                  // initialValue: description ?? 'a',
                  controller: descriptionController..text = description ?? '',
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(hintText: "Enter your number"),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Update'),
                onPressed: () {
                  // addintoList(idController.text.trim(),
                  //     descriptionController.text.trim());
                  if (index! > 0) {
                    daysSchedule[index].description =
                        descriptionController.text.trim();
                    daysSchedule[index].id = idController.text.trim();

                    print(daysSchedule[index].description.toString());
                  }

                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: new Text('Submit'),
                onPressed: () {
                  addintoList(idController.text.trim(),
                      descriptionController.text.trim());
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ADD EVENT')),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          children: [
            Text(startDate.toString(),
            style: TextStyle(fontSize: 26.sp,color: Colors.red),
            
            ),
            ElevatedButton(
                onPressed: () {
                  startDateFunction(context);
                },
                child: Text('startDate')),
            Text(endDate.toString(),         style: TextStyle(fontSize: 26.sp,color: Colors.purple),),
            ElevatedButton(
                onPressed: () {
                  endDateFunction(context);
                },
                child: Text('ENd date')),
            ElevatedButton(
                onPressed: () async {
                  // final d1 = DateTime.now();
                  // final d2 = d1.add(Duration(days: 2));
                  // print(d2);
      if (startDate.compareTo(endDate) > 0){

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          'Start date must before end date'
        )));
      }else{
                   List<DaySchedule> dataList =[];
getDaysInBetween(startDate,endDate);
                   listOfDays.forEach((element) { 
                    dataList.add(
                    //   {
                    //   'date':element.date,
                    //     'dateOfEventId':element.dateOfEventId,
                    //   'schedule':[]
                    // }
                    DaySchedule(date: element.date,dateOfEventId: element.dateOfEventId,schedule: [])


                    );
                   });

                   print(dataList);

                  await EventServices.addEvent(schedulList:   dataList,listOfdays:  listOfDays);
                }
                },
                child: Text('POST A EVENT')),
            ElevatedButton(
                onPressed: () {
                  _displayDialog(context);
                },
                child: Text('add day schedule')),
                    ElevatedButton(
                onPressed: () {
     Navigator.push(context, MaterialPageRoute(builder: (context)=>AddScheduleScreen()));
                },
                child: Text('Schedule Screen')),
            Expanded(
                child: ListView.builder(
                    itemCount: daysSchedule.length,
                    itemBuilder: (context, index) {
                      DummyClass dummyClass = daysSchedule[index];
                      return ListTile(
                        onTap: () {
                          _displayDialog(context,
                              id: dummyClass.id,
                              description: dummyClass.description,
                              index: index);
                        },
                        title: Text(dummyClass.id.toString()),
                        subtitle: Text(dummyClass.description.toString()),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class DummyClass {
  String? id;
  String? description;

  DummyClass({this.id, this.description});

  DummyClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    return data;
  }
}
