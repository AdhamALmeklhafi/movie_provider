//@dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_apps/Screen/SplashScreen.dart';
import 'package:movie_apps/Screen/home.dart';
import 'package:movie_apps/view/movie_list.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          // Define the default brightness and colors.
          // primarySwatch: Colors.blue,

          // Define the default font family.
          fontFamily: 'FiraSans',

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
