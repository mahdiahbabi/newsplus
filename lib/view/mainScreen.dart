


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsplus/controll/ScreenController.dart';
import 'package:newsplus/view/ArticleInfo.dart';
import 'package:newsplus/view/HomeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScreenController screenController = Get.put(ScreenController());
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
      List<Widget> screen = [HomeScreen()];
    return  Scaffold(
    bottomNavigationBar: Obx(
      ()=> CurvedNavigationBar(
        index: screenController.currentIndex.value,
                  backgroundColor: Colors.blueAccent,
                  items: const[
                  Icon(Icons.add, size: 30),
                  Icon(Icons.list, size: 30),
                  Icon(Icons.compare_arrows, size: 30),
                ],
                onTap: (index) {
           screenController.currentIndex.value = index;
                pageController.jumpToPage(index);
                },
                ),
    ),
      body: PageView(
        children: screen,
         onPageChanged: (int index) {
            screenController.currentIndex.value = index;
          },
        controller: pageController,

 
      ),
    );
  }
}