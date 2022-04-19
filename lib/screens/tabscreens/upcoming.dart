import 'package:flutter/material.dart';
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/models/upcoming.dart';
import 'package:movie_app/screens/moviesdetail/upcomingscreen.dart';
import 'package:movie_app/services/api_manger.dart';
import 'package:movie_app/widget/errorwidegt.dart';

class Upcomingwidget extends StatefulWidget {
  const Upcomingwidget({Key? key}) : super(key: key);

  @override
  State<Upcomingwidget> createState() => _UpcomingwidgetState();
}

class _UpcomingwidgetState extends State<Upcomingwidget> {
  late Future<Upcoming> upcoming;
  @override
  void initState() {
    super.initState();
    upcoming = MoviesApi().getupcoming();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Upcoming>(
        future: upcoming,
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
                    var upcomings = snapshot.data!.results[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UpcomingDetail(detail: upcomings)));
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
                                          upcomings.posterPath),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(
                              child: Text(
                                upcomings.title,
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
