// ignore_for_file: must_be_immutable

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:newsplus/view/HomeScreen.dart';
import 'package:newsplus/view/Profile.dart';

import 'BookMark.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

var selectedIndex = 0;

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: selectedIndex,
          items: const <Widget>[
            Icon(Icons.home),
            Icon(Icons.explore),
            Icon(Icons.bookmark),
            Icon(Icons.person)
          ],
          onTap: (value) => value == 0
              ? pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease)
              : value == 2
                  ? pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn)
                  : pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: [
                HomeScreen(),
                const Profile(),
                 BookMark(),
              ],
              onPageChanged: (page) {
                setState(() {
                  selectedIndex = page;
                });
              }),
        ),
      ),
    );
  }
}
