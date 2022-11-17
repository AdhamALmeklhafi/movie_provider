import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_apps/Screen/home.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Read in any way convenient way!",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(
        child: Lottie.asset(
          'assets/lottie/1.json',
          height: 250.0,
          repeat: true,
          reverse: true,
          animate: true,
        ),
      ),
      decoration: const PageDecoration(
        bodyFlex: 2,
        imageFlex: 3,
        bodyTextStyle: TextStyle(color: Color.fromARGB(255, 214, 176, 132)),
        titleTextStyle: TextStyle(color: Color(0xFFF09A36), fontSize: 28),
      ),
    ),
    PageViewModel(
      title: "laborum consequat ex reprehenderit",
      body: "laborum consequat ex reprehenderit cupidatat mollit officia.",
      image: Center(
        child: Lottie.asset(
          'assets/lottie/2.json',
          height: 400.0,
          repeat: true,
          reverse: true,
          animate: true,
        ),
      ),
      decoration: const PageDecoration(
        bodyFlex: 2,
        imageFlex: 3,
        bodyTextStyle: TextStyle(color: Color.fromARGB(255, 214, 176, 132)),
        titleTextStyle: TextStyle(color: Color(0xFFF09A36), fontSize: 28),
      ),
    ),
    PageViewModel(
      title: "laborum consequat ex reprehenderit",
      body: "laborum consequat ex reprehenderit cupidatat mollit officia.",
      image: Center(
        child: Lottie.asset(
          'assets/lottie/3.json',
          height: 350.0,
          repeat: true,
          reverse: true,
          animate: true,
        ),
      ),
      decoration: const PageDecoration(
        bodyFlex: 2,
        imageFlex: 3,
        bodyTextStyle: TextStyle(color: Color.fromARGB(255, 214, 176, 132)),
        titleTextStyle: TextStyle(color: Color(0xFFF09A36), fontSize: 28),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F202B),
      body: SafeArea(
        child: Stack(
          children: [
            IntroductionScreen(
              pages: pages,
              onDone: () {
                // When done button is press
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              onSkip: () {
                // You can also override onSkip callback
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              showSkipButton: true,
              skip: Text(
                'Skip',
                style: TextStyle(color: Color(0xFFF09A36), fontSize: 18),
              ),
              next: const Icon(Icons.arrow_forward),
              globalBackgroundColor: Color(0xFF1F202B),
              done: const Text("Done",
                  style: TextStyle(color: Color(0xFFF09A36), fontSize: 18)),
              dotsDecorator: const DotsDecorator(
                size: Size(10.0, 10.0),
                color: Color(0xFFF09A36),
                activeColor: Color(0xFFF09A36),
                activeSize: Size(22.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
