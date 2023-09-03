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
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const IntroScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    navigateToStartingScreen(context);
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
