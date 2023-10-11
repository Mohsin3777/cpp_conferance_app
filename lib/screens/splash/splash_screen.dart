import 'package:conferance_app/screens/bottombar/custom_bottom_bar.dart';
import 'package:conferance_app/services/load_data.dart';
import 'package:conferance_app/utils/local_storage.dart';
import 'package:flutter/material.dart';

import '../intro/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToStartingScreen(BuildContext context) {
    // ignore: use_build_context_synchronously
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const IntroScreen()));
    });
  }

    nextScreen() async {
    await LocalStorageRepository().getToken().then((token) async {
      if (token == "" || token == null) {
        await Future.delayed(const Duration(seconds: 2)).then((value) =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const IntroScreen())));
        loadData();
      } else {
    loadData();
      }
    });
  }


loadData(){
  Future.delayed(Duration(seconds: 1),() {

    LoadData.getUserData(context: context);
            Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CustomBottomNavigationBar()));
  },);
}
  @override
  Widget build(BuildContext context) {
    // navigateToStartingScreen(context);
    nextScreen();
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Center(
            child: Image(
          image: AssetImage('assets/logo/splash_image.png'),
        )),
      ),
    );
  }
}
