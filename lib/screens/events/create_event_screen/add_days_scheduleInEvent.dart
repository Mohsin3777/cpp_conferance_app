import 'package:conferance_app/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class AddDaysScheduleInEventsScreen extends StatefulWidget {
  const AddDaysScheduleInEventsScreen({super.key});

  @override
  State<AddDaysScheduleInEventsScreen> createState() =>
      _AddDaysScheduleInEventsScreenState();
}

class _AddDaysScheduleInEventsScreenState
    extends State<AddDaysScheduleInEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Days Schedule')),
      body: Consumer<EventProvider>(
        builder: (context, eventProvInstance, child) {
          return Center(
            child: Text(eventProvInstance.createdEventId.toString()),
          );
        },
      ),
    );
  }
}
