import 'package:flutter/material.dart';
import 'package:movie_apps/Constant/Constant.dart';
import 'package:movie_apps/Constant/dimensions.dart';
import 'package:movie_apps/Screen/tv_detaial.dart';
import 'package:movie_apps/view/movie_list.dart';
import 'package:provider/provider.dart';

class NewTv extends StatefulWidget {
  const NewTv({Key? key}) : super(key: key);

  @override
  State<NewTv> createState() => _NewTvState();
}

class _NewTvState extends State<NewTv> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieList>(context, listen: false).fetchTv();
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
              flex: 5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: movieList.tvList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailTvScreen(id: index))),
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
                                    context: context, number: 190),
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
                                        'https://image.tmdb.org/t/p/w500${movieList.tvList[index].poster_path}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          movieList.tvList[index].name.length > 29
                              // ignore: prefer_interpolation_to_compose_strings
                              ? movieList.tvList[index].name.substring(0, 10) +
                                  '...'
                              : movieList.tvList[index].name,
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
                                movieList.tvList[index].vote_average.toString(),
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
