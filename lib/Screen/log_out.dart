import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_apps/Constant/Constant.dart';
import 'package:movie_apps/Screen/home.dart';
import 'package:movie_apps/Screen/search.dart';
import 'package:movie_apps/Widget/bottom_bar.dart';

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  var buttonBaN = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F202B),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello, Want to log out!',
                style: primaryTextF,
              ),
              Lottie.asset(
                'assets/lottie/sign_out.json',
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFF09A36),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
                child: const Text('Click to Log Out'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
          BottomNu: buttonBaN,
          callback: (int index) {
            buttonBaN = index;
            setState(() {
              if (buttonBaN == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Home();
                    },
                  ),
                );
              } else if (buttonBaN == 1) {
                buttonBaN = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchPage();
                    },
                  ),
                );
              } else if (buttonBaN == 2) {
                buttonBaN = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LogOut();
                    },
                  ),
                );
              }
            });
          }),
    );
  }
}
