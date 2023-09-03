import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_constant.dart';

class CustomTabBar extends StatelessWidget {
  final TabController? tabController;
  final List<Widget> tabs;
  final Function(int)? ontap;
  const CustomTabBar({
    Key? key,
    this.tabController,
    required this.tabs,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.h,
        child: TabBar(
          labelStyle: const TextStyle(color: Colors.white),
          controller: tabController,
          indicatorColor: Colors.transparent,
          labelColor: AppConstants.CONSTANT_COLOR,
          unselectedLabelColor: Colors.black,
          onTap: ontap,
          // tabs: [
          //   CustomEventTab(tabController: tabController),
          //   CustomEventTab(tabController: tabController),
          // ]
          //
          tabs: tabs,
        ));
  }
}

class CustomEventTab extends StatelessWidget {
  final TabController? tabController;
  final String? tabText;
  const CustomEventTab({super.key, this.tabController, this.tabText});

  @override
  Widget build(BuildContext context) {
    return Tab(
      // text: 'Place Bid',
      child: Column(
        children: [
          FittedBox(
            child: Text(
              tabText ?? '',
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Visibility(
              visible: tabController!.index == 0 ? true : false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _customDots(height: 3.h, width: 3.w),
                  SizedBox(width: 2.w),
                  _customDots(height: 5.h, width: 5.w),
                  SizedBox(width: 2.w),
                  _customDots(height: 7.h, width: 7.w),
                ],
              ))
        ],
      ),
    );
  }

  _customDots({double? width, double? height}) {
    return Container(
      decoration: BoxDecoration(
          color: AppConstants.CONSTANT_COLOR,
          borderRadius: BorderRadius.circular(10.r)),
      height: height ?? 7.h,
      width: width ?? 7.w,
    );
  }
}
