import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/themes/colors.dart';

import 'about_app.dart';
import 'fav_movies.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var icons = <IconData>[
    Icons.local_fire_department,
    Icons.favorite,
  ];

  int currentIndex = 0;
  List<Widget> listOfScreens = [
    HomeScreen(),
    FavMovies(),
    AboutApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AboutApp()));
        },
        backgroundColor: AppColors.primaryColor,
        child: Image.asset('assets/images/popcornone.png'),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: AppColors.primaryColor,
        icons: icons,
        iconSize: 30,
        inactiveColor: Colors.red,
        activeColor: Colors.red,
        activeIndex: currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => currentIndex = index),
        //other params
      ),
      body: listOfScreens[currentIndex],
    );
  }
}
