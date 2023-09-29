import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventAdd extends StatefulWidget {
  const EventAdd({super.key});

  @override
  State<EventAdd> createState() => _EventAddState();
}

class _EventAddState extends State<EventAdd> {

  List<mm> schedule=[];


  addtoList(mm m){
    schedule.add(m);
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Event'),
      ),
      body: Container(
        height: 1.sh,
        child: Column(
children: [
  ElevatedButton(onPressed: (){


    mm m1 = mm(
      id: '1',
      content: 'MOHSIN'
    );

    addtoList(m1);
    setState(() {
      
    });
  }, child: Text('aa')),

  Expanded(child: ListView.builder(
    itemCount: schedule.length,
    itemBuilder: (context,index){

    // mm m =mm.fromJson(schedule[index] as Map<String,String>);

    mm m = schedule[index];
    return ListTile(
      title: Text(m.content.toString(),
      style: TextStyle(color: Colors.black),
      ),
    );
  }))
],
        ),
      ),
    );
  }
}


class mm {
  String? id;
  String? content;

  mm({this.id, this.content});

  mm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    return data;
  }
}