import 'package:flutter/material.dart';
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/models/popularmovies.dart';
import 'package:movie_app/screens/moviesdetail/detailscreen.dart';
import 'package:movie_app/services/api_manger.dart';
import 'package:movie_app/widget/errorwidegt.dart';

class PopularWidget extends StatefulWidget {
  const PopularWidget({Key? key}) : super(key: key);

  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  late Future<PopularMovies> popularmovie;
  @override
  void initState() {
    super.initState();
    popularmovie = MoviesApi().getpopular();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularMovies>(
      future: popularmovie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            child: GridView.builder(
                itemCount: snapshot.data!.results.length,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  var popular = snapshot.data!.results[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PopularDetailScreen(detail: popular)));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 160,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        Strings.Baseurl + popular.posterPath),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            child: Text(
                              popular.title,
                              style: Theme.of(context).textTheme.headline6,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
                }),
          );
        }
        if (snapshot.hasError) {
          return const ErrorWidgets();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
