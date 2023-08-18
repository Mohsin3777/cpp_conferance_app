import 'package:conferance_app/constants/app_constant.dart';
import 'package:conferance_app/screens/auth/resetpassword/resat_password.dart';
import 'package:conferance_app/screens/home/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<Widget> pages = [
    MainScreen(),
    ResetPasswordScreen(),
    MainScreen(),
    MainScreen(),
  ];
  int _selectedIndex = 0;
  void _incrementTab(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.camera_alt),
          ),
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedIconTheme: IconThemeData(color: AppConstants.CONSTANT_COLOR),
          onTap: (index) {
            _incrementTab(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/bottom_bar_image1.svg',
                    color: AppConstants.CONSTANT_COLOR),
                label: ''
                // label: 'Calls',
                ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/bottom_bar_image2.svg'),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/bottom_bar_image3.svg'),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/bottom_bar_image4.svg'),
                label: ''),
          ]),
    );
  }
}
















//old bottombar

      // floatingActionButton: FloatingActionButton(
      //   //Floating action button on Scaffold
      //   onPressed: () {
      //     //code to execute on button press
      //   },
      //   child: Icon(Icons.send), //icon inside button
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   //bottom navigation bar on scaffold
      //   color: Colors.white,
      //   shape: CircularNotchedRectangle(), //shape of notch
      //   notchMargin:
      //       5, //notche margin between floating button and bottom appbar
      //   child: Padding(
      //     padding: EdgeInsets.all(15.0.sp),
      //     child: Row(
      //       //children inside bottom appbar
      //       mainAxisSize: MainAxisSize.max,
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         InkWell(
      //             onTap: () {},
      //             child: SvgPicture.asset('assets/svg/bottom_bar_image1.svg')),
      //         InkWell(
      //             onTap: () {},
      //             child: SvgPicture.asset('assets/svg/bottom_bar_image2.svg')),
      //         InkWell(
      //             onTap: () {},
      //             child: SvgPicture.asset('assets/svg/bottom_bar_image3.svg')),
      //         InkWell(
      //             onTap: () {},
      //             child: SvgPicture.asset('assets/svg/bottom_bar_image4.svg')),
      //       ],
      //     ),
      //   ),
      // ),