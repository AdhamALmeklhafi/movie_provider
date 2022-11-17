import 'package:flutter/material.dart';
import 'package:movie_apps/Constant/Constant.dart';
import 'package:movie_apps/Constant/dimensions.dart';
import 'package:movie_apps/Screen/movie_detial.dart';
import 'package:movie_apps/view/movie_list.dart';
import 'package:provider/provider.dart';

class NewMovies extends StatefulWidget {
  const NewMovies({Key? key}) : super(key: key);

  @override
  State<NewMovies> createState() => _NewMoviesState();
}

class _NewMoviesState extends State<NewMovies> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieList>(context, listen: false).fetchMovie();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, MovieList movieList, child) {
      return movieList.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Expanded(
              flex: 3,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: movieList.movieList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(id: index))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, right: 10),
                              child: Container(
                                height: Dimensions.calculateH(
                                    context: context, number: 100),
                                width: Dimensions.calculateW(
                                    context: context, number: 150),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.yellow.withOpacity(0.4),
                                      Colors.black.withOpacity(0.5),
                                    ],
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500${movieList.movieList[index].backdrop_path}'),
                                      fit: BoxFit.fitHeight),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          movieList.movieList[index].title.length > 27
                              // ignore: prefer_interpolation_to_compose_strings
                              ? movieList.movieList[index].title
                                      .substring(0, 10) +
                                  '...'
                              : movieList.movieList[index].title,
                          style: hintText2,
                        ),
                        SizedBox(
                          height: Dimensions.calculateH(
                              context: context, number: 5),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFF09A36),
                              size: 17,
                            ),
                            const Icon(
                              Icons.star,
                              color: Color(0xFFF09A36),
                              size: 17,
                            ),
                            const Icon(
                              Icons.star,
                              color: Color(0xFFF09A36),
                              size: 17,
                            ),
                            const Icon(
                              Icons.star,
                              color: Color(0xFFF09A36),
                              size: 17,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                movieList.movieList[index].vote_average
                                    .toString(),
                                style: hintTextLo,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
    });
  }
}
