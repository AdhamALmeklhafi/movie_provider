import 'package:movie_apps/Constant/Constant.dart';
import 'package:movie_apps/Constant/dimensions.dart';
import 'package:movie_apps/Constant/model.dart';
import 'package:movie_apps/Screen/home.dart';
import 'package:movie_apps/Screen/log_out.dart';
import 'package:movie_apps/Widget/bottom_bar.dart';

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  List<Book> books = allBooks;
  var buttonBaN = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F202B),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Search for The Movie",
                    style: primaryTextF,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: Dimensions.calculateH(context: context, number: 20),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFFF09A36),
                      ),
                      hintText: 'search for the movie',
                      hintStyle: const TextStyle(color: Color(0xFFF09A36)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFFF09A36),
                          width: 1,
                        ),
                      ),
                    ),
                    autofocus: Colors.accents.contains(Colors.amber),
                    onChanged: searchItem,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height:
                        Dimensions.calculateH(context: context, number: 700),
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 0, right: 6),
                      itemCount: books.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final book = books[index];

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                height: 130,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(book.posterPath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: Dimensions.calculateW(
                                        context: context, number: 200),
                                    child: Text(
                                      book.name,
                                      style: primaryTextF,
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    width: 250,
                                    child: Text(
                                      book.overview,
                                      style: hintText2,
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
          BottomNu: buttonBaN,
          callback: (int index) {
            buttonBaN = index;
            setState(() {
              if (buttonBaN == 0) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              } else if (buttonBaN == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              } else if (buttonBaN == 2) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LogOut()));
              }
            });
          }),
    );
  }

  void searchItem(String query) {
    final suggestions = allBooks.where((item) {
      final itemTitle = item.name.toLowerCase();
      final input = query.toLowerCase();

      return itemTitle.contains(input);
    }).toList();
    setState(() => books = suggestions);
  }
}
