import 'package:conferance_app/practice/add_event.dart';
import 'package:conferance_app/providers/auth_provider.dart';
import 'package:conferance_app/providers/event_provider.dart';
import 'package:conferance_app/screens/events/create_event_screen/create_basic_event.dart';

import 'package:conferance_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => AuthProvider()),
                ChangeNotifierProvider(create: (_) => EventProvider()),
              ],
              child: MaterialApp(
                  title: 'Conferance App',
                  theme: MyTheme.lightTheme(),
                  // home: ResetPasswordScreen(),
                  home: CreateBasicEvent()
                  // home: CustomBottomNavigationBar(),
                  // home: AddEventPracticeScreen(),
                  // home: EventDetailsScreen(),
                  ));
        });
  }
}
