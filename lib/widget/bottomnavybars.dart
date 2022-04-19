import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:movie_app/screens/navyscreens/favouritescreen.dart';
import 'package:movie_app/screens/navyscreens/home.dart';
import 'package:movie_app/screens/navyscreens/profilescreen.dart';
import 'package:movie_app/utilis/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int initalIndex = 0;

  void selectedItem(index) {
    setState(() {
      initalIndex = index;
    });
  }

  List<Widget> screens = const [
    HomeScreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(initalIndex),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        selectedIndex: initalIndex,
        curve: Curves.easeIn,
        itemCornerRadius: 50,
        items: [
          BottomNavyBarItem(
              activeColor: Colors.green,
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              inactiveColor: lightthemes == CustomThemes.darkThemes()
                  ? Colors.white
                  : Colors.black),
          BottomNavyBarItem(
              activeColor: Colors.green,
              icon: const Icon(Icons.favorite),
              title: const Text("favourite"),
              inactiveColor: lightthemes == CustomThemes.darkThemes()
                  ? Colors.white
                  : Colors.black),
          BottomNavyBarItem(
              activeColor: Colors.green,
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              inactiveColor: lightthemes == CustomThemes.darkThemes()
                  ? Colors.white
                  : Colors.black),
        ],
        onItemSelected: selectedItem,
      ),
    );
  }
}
