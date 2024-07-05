import 'package:chart_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var mq;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      //exit full screen mode
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context)
        .size; //initialized media query for getting device screen size
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: mq.height * 0.15,
            right: mq.width * 0.25,
            width: mq.width * 0.5,
            child: Image.asset('assets/icon.png'),
          ),
          Positioned(
            bottom: mq.height * 0.15,
            width: mq.width,
            child: const Text(
              'Welcome to Weather Charts',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurple),
            ),
          )
        ],
      ),
    );
  }
}
