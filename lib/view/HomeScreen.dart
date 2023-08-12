import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:newsplus/component/MyString.dart';
import 'package:newsplus/controll/homescreencontroller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('mahdi'),
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Obx(
                    ()=> homeScreenController.Breakingnewslist.value.isEmpty ? SpinKitCircle(color: Colors.pink,) 
                     : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 270,
                          height: 300,
                          color: Colors.blueGrey,
                          child: Column(
                            children: [
                              //TODO:و تکست اضافه کردن عکس
                              Text(homeScreenController.Breakingnewslist.value[index].name!)
                            ],
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
