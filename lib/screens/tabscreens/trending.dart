import 'package:flutter/material.dart';
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/models/trending.dart';
import 'package:movie_app/screens/moviesdetail/trendingscreen.dart';
import 'package:movie_app/services/api_manger.dart';
import 'package:movie_app/widget/errorwidegt.dart';

class TrendingWidget extends StatefulWidget {
  const TrendingWidget({Key? key}) : super(key: key);

  @override
  State<TrendingWidget> createState() => _TrendingWidgetState();
}

class _TrendingWidgetState extends State<TrendingWidget> {
  late Future<Trending> trend;

  @override
  void initState() {
    super.initState();
    trend = MoviesApi().gettrending();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Trending>(
        future: trend,
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
                    var trendings = snapshot.data!.results[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TrendingDetails(detail: trendings)));
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
                                      image: NetworkImage(Strings.Baseurl +
                                          trendings.posterPath),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(
                              child: Text(
                                trendings.title,
                                style: Theme.of(context).textTheme.headline6,
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
        });
  }
}
