import 'package:flutter/material.dart';
import 'package:movie_apps/Screen/tv_detaial.dart';
import 'package:movie_apps/view/movie_list.dart';

import 'package:provider/provider.dart';

class SeeAllTv extends StatefulWidget {
  const SeeAllTv({Key? key}) : super(key: key);

  @override
  State<SeeAllTv> createState() => _SeeAllTvState();
}

class _SeeAllTvState extends State<SeeAllTv> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieList>(context, listen: false).fetchTv();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F202B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F202B),
        title: const Text(
          'Tv Shows',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, MovieList movieList, child) {
            return movieList.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: movieList.movieList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailTvScreen(id: index))),
                        child: Container(
                          // It will cover 40% of our total width
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 10 / 2,
                            bottom: 10 * 2.5,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: 0,
                                    bottom: 0,
                                  ),
                                  width: 200,
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${movieList.tvList[index].backdrop_path}',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(20 / 2),
                                  decoration: BoxDecoration(
                                      // color: Colors.white,
                                      // borderRadius: const BorderRadius.only(
                                      //   bottomLeft: Radius.circular(10),
                                      //   bottomRight: Radius.circular(10),
                                      // ),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 10),
                                            blurRadius: 50,
                                            color: Colors.black26
                                                .withOpacity(0.23))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          movieList.tvList[index].name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
