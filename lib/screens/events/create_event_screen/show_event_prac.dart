import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:conferance_app/practice/practice_event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constant.dart';
import '../../../providers/event_provider.dart';
import '../../../services/http_services/event_services/event_services.dart';
import '../../home/widgers/custom_svg_icon_button.dart';
import '../widgets/custom_readmore_text_widget.dart';
import '../widgets/upcoming_event_card.dart';

class ShowEvent extends StatefulWidget {
  const ShowEvent({super.key});

  @override
  State<ShowEvent> createState() => _ShowEventState();
}

class _ShowEventState extends State<ShowEvent> {
  PracticeEventModel? practiceEventModel = PracticeEventModel();
  List<DaySchedule>? daysScheduleList = [];

  bool loading = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loading = true;
    });
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

    setState(() {
      loading = false;
    });

    print(practiceEventModel!.data!.dateOfEvent);
  }

  @override
  Widget build(BuildContext context) {
    // print(practiceEventModel!.data!.titleImage.toString());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        height: 1.sh,
        width: 1.sw,
        child: loading == false
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 215.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(practiceEventModel!
                                      .data!.titleImage ??
                                  'https://images.unsplash.com/photo-1573164574572-cb89e39749b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fG1lZXRpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          practiceEventModel!.data!.title ?? '',
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 18.sp),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.bookmark_outline,
                              size: 30.sp,
                            ),
                            Icon(
                              Icons.share_outlined,
                              size: 30.sp,
                            )
                          ],
                        ),
                      ],
                    ),
                    _customIconWIthText(
                        iconData: Icons.calendar_month,
                        subTitle: practiceEventModel!
                            .data!.dateOfEvent!.first.date
                            .toString(),
                        titleText: 'aa'),
                    _customIconWIthText(
                        iconData: Icons.location_city,
                        subTitle: practiceEventModel!.data!.address.toString(),
                        titleText: 'Address'),
                    Text(
                      'About this event',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ExpandableText(
                      practiceEventModel!.data!.description ??
                          'Maecenas faucibus mollis interdum. Nullam quis risus eget urna mollis ornare vel eu leo, lenean eli lacinia bibendum nulla sed consectetur quis risus eget urna urna mollis ornare vel eu leo.. read more',
                    ),
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
                          itemCount:
                              practiceEventModel!.data!.dateOfEvent!.length,
                          itemBuilder: (context, index) {
                            return CustomExpandableTile1(
                              ind: index,
                              practiceEventModel: practiceEventModel!,
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageStack(),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          '+92 Are Going',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomSvgIconButton(
                          backgroundColor: Color(0xffFB0201),
                          svgIcon: 'assets/svg/play_svg_icon.svg',
                        ),
                      ],
                    )
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  _customIconWIthText(
      {required String titleText,
      required String subTitle,
      required IconData iconData}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppConstants.CONSTANT_COLOR,
            shape: BoxShape.rectangle),
        padding: EdgeInsets.all(15.sp),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
      title: Text(
        titleText,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: AppConstants.CONSTANT_COLOR),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
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
