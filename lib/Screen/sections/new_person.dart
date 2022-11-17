import 'package:flutter/material.dart';
import 'package:movie_apps/Constant/Constant.dart';
import 'package:movie_apps/Constant/dimensions.dart';
import 'package:movie_apps/Screen/movie_detial.dart';
import 'package:movie_apps/Screen/person_detail.dart';
import 'package:movie_apps/Screen/tv_detaial.dart';
import 'package:movie_apps/view/movie_list.dart';
import 'package:provider/provider.dart';

class NewPerson extends StatefulWidget {
  const NewPerson({Key? key}) : super(key: key);

  @override
  State<NewPerson> createState() => _NewPersonState();
}

class _NewPersonState extends State<NewPerson> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieList>(context, listen: false).fetchPerson();
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
              flex: 2,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: movieList.personList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonDetails(id: index))),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Container(
                        width:
                            Dimensions.calculateW(context: context, number: 70),
                        height:
                            Dimensions.calculateH(context: context, number: 70),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.yellow.withOpacity(0.4),
                              Colors.black.withOpacity(0.5),
                            ],
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${movieList.personList[index].profile_path}'),
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}
