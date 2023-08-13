
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controll/homescreencontroller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Obx(
      ()=> homeScreenController.loading.value ? const SpinKitDualRing(color: Colors.amberAccent) 
      : Scaffold(
        appBar: AppBar(
          title: const Text('mahdi'),
        ),
        body: Container(
          height: screenSize.height,
          width: screenSize.width,
          color: Colors.amberAccent,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.redAccent,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeScreenController.breakingNewslist.length,
                  itemBuilder: (context, index) {
    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 270,
                            height: 300,
                            color: Colors.blueGrey,
                            child: Column(
                              children: [
                                //TODO:و تکست اضافه کردن عکس
                               // ignore: invalid_use_of_protected_member
                               
                               CachedNetworkImage(imageUrl: homeScreenController.breakingNewslist.value[index].urlToImage!,
                               height: 100,
                               width: 100,
                               fit: BoxFit.cover,
                               placeholder:(context, url) =>  const SpinKitFadingCircle(color: Colors.redAccent),
                               errorWidget: (context, url, error) => const Icon(CupertinoIcons.phone_fill_arrow_down_left),
                               ),
                               
                                Text(homeScreenController.breakingNewslist.value[index].title!)
                              ],
                            )),
                      
                    );
                  },
                ),
              ),

                   Container(
                width: double.infinity,
                height: 300,
                color: Colors.blueAccent,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeScreenController.breakingNewslist.length,
                  itemBuilder: (context, index) {
    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 270,
                            height: 300,
                            color: Colors.blueGrey,
                            child: Column(
                              children: [
                                //TODO:و تکست اضافه کردن عکس
                               // ignore: invalid_use_of_protected_member
                               
                               CachedNetworkImage(imageUrl: homeScreenController.economyList.value[index].urlToImage!,
                               height: 100,
                               width: 100,
                               fit: BoxFit.cover,
                               placeholder:(context, url) =>  const SpinKitFadingCircle(color: Colors.redAccent),
                               errorWidget: (context, url, error) => const Icon(CupertinoIcons.phone_fill_arrow_down_left),
                               ),
                               
                                Text(homeScreenController.economyList.value[index].title!)
                              ],
                            )),
                      
                    );
                  },
                ),
              ),
           
           












           
            ],
          ),
        ),
      ),
    );
  }
}
