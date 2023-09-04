import 'dart:convert';
import 'dart:io';

import 'package:conferance_app/services/http_services/event_services/event_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

import '../practice/practice_event_model.dart';

class EventProvider extends ChangeNotifier {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<DateOfEvent> listOfDays = []; //calcaute dates
  List<DaySchedule> daysSchedule = []; // final list of date schedule with id
  var uuid = Uuid(); //for create unique id

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //in this we pick start date
  Future<void> startDateFunction(
    BuildContext context,
  ) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));

    if (picked != null && picked != startDate) {
      // if (DateUtils.isSameDay(picked, endDate)){
      if (picked.compareTo(endDate) == 0) {
        print('same day');

        startDate = picked;
        notifyListeners();
      } else {
        if (picked.compareTo(endDate) < 0) {
          print("Start date  is before endDate");

          startDate = picked;
          notifyListeners();
        }

        if (picked.compareTo(endDate) > 0) {
          print("Start date  is after endDate");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Start date  is after endDate')));

          startDate = DateTime.now();
          notifyListeners();
        }
      }
    }
  }

  //we pick end date
  Future<void> endDateFunction(
    BuildContext context,
  ) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != endDate) {
      if (DateUtils.isSameDay(picked, startDate)) {
        endDate = picked;
        notifyListeners();
        print('same day');
      } else {
        if (startDate.compareTo(endDate) < 0) {
          print("DT1 is before DT2");

          endDate = picked;
          notifyListeners();

          Duration diff = endDate.difference(startDate);
          // getDaysInBetween(startDate,endDate);

          // noOfdays = diff.inDays;
          notifyListeners();
        }

        if (startDate.compareTo(endDate) > 0) {
          print("DT1 is after DT2");

          endDate = DateTime.now();
          notifyListeners();
        }
      }
    }
  }

  //calcualte dates between start and end date
  getDaysInBetween() {
    List<DateTime> days = [];

    if (startDate.compareTo(endDate) == 0) {
      listOfDays = [];
      days.add(startDate);

      listOfDays.add(DateOfEvent(
          date: days[0].toString().split(' ')[0], dateOfEventId: uuid.v1()));

      setDatesWithUniqueId();
    } else {
      for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
        days.add(startDate.add(Duration(days: i)));
      }
      listOfDays = [];
      days.forEach((day) {
        // print(day.toString().split(' ')[0]);
        listOfDays.add(DateOfEvent(
            date: day.toString().split(' ')[0], dateOfEventId: uuid.v1()));
      });

      setDatesWithUniqueId();
    }

    print(listOfDays.length);
  }

  //set dates with id
  setDatesWithUniqueId() {
    daysSchedule = [];
    listOfDays.forEach((element) {
      daysSchedule.add(
          //   {
          //   'date':element.date,
          //     'dateOfEventId':element.dateOfEventId,
          //   'schedule':[]
          // }
          DaySchedule(
              date: element.date,
              dateOfEventId: element.dateOfEventId,
              schedule: []));

      print(daysSchedule[0].dateOfEventId);
    });

    notifyListeners();
  }

  uploadDataToServer(EventModelData? eventModelData, File image) {
    isLoading = true;
    _uploadEventToServer(eventModelData, image);
    isLoading = false;
    notifyListeners();
  }

  _uploadEventToServer(EventModelData? eventModelData, File? image) async {
    // var bytes = await rootBundle.load(image!.path);
    // var buffer = bytes.buffer;
    // var imageBytes =
    //     buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    // // Encode the bytes
    // var base64Image = base64Encode(imageBytes);

    await EventServices.addEvent(eventModelData, image!.path);
  }
}
