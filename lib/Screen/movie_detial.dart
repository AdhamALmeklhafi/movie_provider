import 'package:flutter/material.dart';
import 'package:movie_apps/Constant/Constant.dart';
import 'package:movie_apps/Constant/dimensions.dart';
import 'package:movie_apps/view/movie_list.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.id}) : super(key: key);

  var id;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1F202B),
        body: Consumer(
          builder: (context, MovieList movieList, child) {
            return movieList.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF1F202B),
                            size: 35,
                          ),
                        ),
                        backgroundColor: const Color(0xFFF09A36),
                        elevation: 50,
                        expandedHeight: Dimensions.calculateH(
                            context: context, number: 350),
                        flexibleSpace: Container(
                          height: Dimensions.calculateH(
                              context: context, number: 350),
                          color: Colors.white54,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: Dimensions.calculateW(
                                      context: context, number: 220),
                                  height: Dimensions.calculateH(
                                      context: context, number: 300),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.yellow.withOpacity(0.4),
                                        Colors.black.withOpacity(0.5),
                                      ],
                                    ),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500${movieList.movieList[widget.id].poster_path}'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Media Type:',
                                    style: primaryText,
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    movieList.movieList[widget.id].media_type,
                                    style: detailText1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Movie Name:',
                                    style: primaryText,
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    movieList.movieList[widget.id].title,
                                    style: detailText1,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ignore: prefer_const_constructors
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 15),
                                  child: const Text(
                                    'Release date:',
                                    style: primaryText,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                    ),
                                    Text(
                                      movieList
                                          .movieList[widget.id].release_date,
                                      style: detailText1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Introduction:',
                                    style: primaryText,
                                  ),
                                  Text(
                                    movieList.movieList[widget.id].overview,
                                    style: detailText1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.calculateH(
                                  context: context, number: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
