import 'package:flutter/material.dart';
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/lists/upcominglist.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: double.maxFinite,
      child: ListView(
        children: [
          Text(
            "FAVOURITE MOVIES",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 120,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(Strings.Baseurl +
                                    favourite[index].posterPath),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              children: [
                                Text(favourite[index].title,
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_month),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      favourite[index]
                                          .releaseDate
                                          .year
                                          .toString(),
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      favourite[index].voteAverage.toString(),
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Movies",
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: favourite.length),
          ),
        ],
      ),
    );
  }
}
