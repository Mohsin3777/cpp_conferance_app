// class PracticeEventModel {
//   String? message;
//   Data? data;

//   PracticeEventModel({this.message, this.data});

//   PracticeEventModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String? title;
//   String? description;
//   List<String>? dateOfEvent;
//   List<DaySchedule>? daySchedule;
//   String? address;
//   List<Null>? eventImages;
//   String? sId;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;

//   Data(
//       {this.title,
//       this.description,
//       this.dateOfEvent,
//       this.daySchedule,
//       this.address,
//       this.eventImages,
//       this.sId,
//       this.createdAt,
//       this.updatedAt,
//       this.iV});

//   Data.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     description = json['description'];
//     dateOfEvent = json['dateOfEvent'].cast<String>();
//     if (json['daySchedule'] != null) {
//       daySchedule = <DaySchedule>[];
//       json['daySchedule'].forEach((v) {
//         daySchedule!.add(new DaySchedule.fromJson(v));
//       });
//     }
//     address = json['address'];
//     if (json['eventImages'] != null) {
//       eventImages = <Null>[];
//       json['eventImages'].forEach((v) {
//         // eventImages!.add(new Null.fromJson(v));
//       });
//     }
//     sId = json['_id'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['dateOfEvent'] = this.dateOfEvent;
//     if (this.daySchedule != null) {
//       data['daySchedule'] = this.daySchedule!.map((v) => v.toJson()).toList();
//     }
//     data['address'] = this.address;
//     if (this.eventImages != null) {
//       // data['eventImages'] = this.eventImages!.map((v) => v.toJson()).toList();
//     }
//     data['_id'] = this.sId;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }

// class DaySchedule {
//   String? date;
//   List<Schedule>? schedule;

//   DaySchedule({this.date, this.schedule});

//   DaySchedule.fromJson(Map<String, dynamic> json) {
//     date = json['date'];
//     if (json['schedule'] != null) {
//       schedule = <Schedule>[];
//       json['schedule'].forEach((v) {
//         schedule!.add(new Schedule.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['date'] = this.date;
//     if (this.schedule != null) {
//       data['schedule'] = this.schedule!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Schedule {
//   String? time;
//   String? description;

//   Schedule({this.time, this.description});

//   Schedule.fromJson(Map<String, dynamic> json) {
//     time = json['time'];
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['time'] = this.time;
//     data['description'] = this.description;
//     return data;
//   }
// }

class PracticeEventModel {
  String? message;
  EventModelData? data;

  PracticeEventModel({this.message, this.data});

  PracticeEventModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data =
        json['data'] != null ? new EventModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class EventModelData {
  String? title;
  String? titleImage;
  String? description;
  List<DateOfEvent>? dateOfEvent;
  List<DaySchedule>? daySchedule;
  String? address;
  List<Null>? eventImages;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  EventModelData(
      {this.title,
      this.titleImage,
      this.description,
      this.dateOfEvent,
      this.daySchedule,
      this.address,
      this.eventImages,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  EventModelData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleImage = json['eventTitleImage'];
    description = json['description'];
    if (json['dateOfEvent'] != null) {
      dateOfEvent = <DateOfEvent>[];
      json['dateOfEvent'].forEach((v) {
        dateOfEvent!.add(new DateOfEvent.fromJson(v));
      });
    }
    if (json['daySchedule'] != null) {
      daySchedule = <DaySchedule>[];
      json['daySchedule'].forEach((v) {
        daySchedule!.add(new DaySchedule.fromJson(v));
      });
    }
    address = json['address'];
    if (json['eventImages'] != null) {
      eventImages = <Null>[];
      // json['eventImages'].forEach((v) {
      //   eventImages!.add(new Null.fromJson(v));
      // });
    }
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['eventTitleImage'] = this.titleImage;
    data['description'] = this.description;
    if (this.dateOfEvent != null) {
      data['dateOfEvent'] = this.dateOfEvent!.map((v) => v.toJson()).toList();
    }
    if (this.daySchedule != null) {
      data['daySchedule'] = this.daySchedule!.map((v) => v.toJson()).toList();
    }
    data['address'] = this.address;
    if (this.eventImages != null) {
      // data['eventImages'] = this.eventImages!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class DateOfEvent {
  String? date;
  String? dateOfEventId;

  DateOfEvent({this.date, this.dateOfEventId});

  DateOfEvent.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateOfEventId = json['dateOfEventId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['dateOfEventId'] = this.dateOfEventId;
    return data;
  }
}

class DaySchedule {
  String? date;
  String? dateOfEventId;
  List<Schedule>? schedule;

  DaySchedule({this.date, this.dateOfEventId, this.schedule});

  DaySchedule.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateOfEventId = json['dateOfEventId'];
    if (json['schedule'] != null) {
      schedule = <Schedule>[];
      json['schedule'].forEach((v) {
        schedule!.add(new Schedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['dateOfEventId'] = this.dateOfEventId;
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  void forEach(Null Function(dynamic key, dynamic value) param0) {}
}

class Schedule {
  String? time;
  String? description;

  Schedule({this.time, this.description});

  Schedule.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['description'] = this.description;
    return data;
  }
}
