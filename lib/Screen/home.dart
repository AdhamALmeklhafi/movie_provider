import 'package:flutter/material.dart';
import 'package:movie_apps/Constant/Constant.dart';
import 'package:movie_apps/Constant/dimensions.dart';
import 'package:movie_apps/Screen/log_out.dart';
import 'package:movie_apps/Screen/search.dart';
import 'package:movie_apps/Screen/sections/new_movies.dart';
import 'package:movie_apps/Screen/sections/new_person.dart';
import 'package:movie_apps/Screen/sections/new_tv.dart';
import 'package:movie_apps/Screen/see_all/list_movies.dart';
import 'package:movie_apps/Screen/see_all/list_tv.dart';
import 'package:movie_apps/Widget/bottom_bar.dart';
import 'package:movie_apps/view/movie_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var buttonBaN = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F202B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              PageView(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Trending TV',
                            style: primaryTextF,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SeeAllTv()));
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height:
                            Dimensions.calculateH(context: context, number: 5),
                      ),
                      NewTv(),
                      SizedBox(
                        height:
                            Dimensions.calculateH(context: context, number: 5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Trending Person',
                            style: primaryTextF,
                          ),
                        ],
                      ),
                      NewPerson(),
                      SizedBox(
                        height:
                            Dimensions.calculateH(context: context, number: 5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Trending Movies',
                            style: primaryTextF,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SeeAllMovie()));
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      NewMovies(),
                    ],
                  ),
                ],
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
