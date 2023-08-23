import 'package:conferance_app/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  String _status = 'Waiting...';

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      allowImplicitScrolling: false,
      // 2. Pass that key to the `IntroductionScreen` `key` param
      key: _introKey,

      globalBackgroundColor: Colors.white,
      // allowImplicitScrolling: true,
      autoScrollDuration: 1000,
      // infiniteAutoScroll: true,
      globalHeader: Text('aa'),

      pages: [
        PageViewModel(title: '', bodyWidget: IntroFirstScreen()),
        PageViewModel(title: '', bodyWidget: IntroFirstScreen()),
      ],
      globalFooter: SizedBox(
        width: double.infinity,
        height: 0,
        child: Container(),
      ),
      onDone: () => _onIntroEnd(context),
      showNextButton: true,
      showDoneButton: true,
      showBackButton: true,
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      back: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: CircleAvatar(radius: 30.r, child: const Icon(Icons.arrow_forward)),
    );
  }
}

class IntroFirstScreen extends StatelessWidget {
  const IntroFirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 400.h,
            width: 1.sw,
            child: Image(
              image: AssetImage('assets/images/intro_image.png'),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Welcome to \nPEC Conference',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 32.sp,
                  letterSpacing: 0.5),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Lorem ipsum dolor sit amet consectetur. Feugiat dis diam quam urna lectus. ',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  letterSpacing: 0.5),
            ),
          )
        ],
      ),
    );
  }
}
