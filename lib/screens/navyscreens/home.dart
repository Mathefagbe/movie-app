import 'package:flutter/material.dart';
import 'package:movie_app/const/circleavarta.dart';
import 'package:movie_app/screens/tabscreens/popular.dart';
import 'package:movie_app/screens/tabscreens/trending.dart';
import 'package:movie_app/screens/tabscreens/upcoming.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView(
        children: [
          SizedBox(
            height: 60,
            width: double.maxFinite,
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: avatar,
              title: Text("Hello, Joseph",
                  style: Theme.of(context).textTheme.headline2),
              subtitle: Text(
                "Let explore your favourite movies",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: double.maxFinite,
            height: 60,
            child: TabBar(controller: _tabController, tabs: [
              Tab(
                child: Text(
                  "POPULAR",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Tab(
                child: Text(
                  "TRENDING",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Tab(
                child: Text(
                  "UPCOMING",
                  style: Theme.of(context).textTheme.headline4,
                ),
              )
            ]),
          ),
          SizedBox(
            height: 500,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: const [
                PopularWidget(),
                TrendingWidget(),
                Upcomingwidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
