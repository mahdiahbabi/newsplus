// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsplus/component/widget.dart';
import 'package:newsplus/controll/homescreencontroller.dart';

class ArticleInfo extends StatelessWidget {
  ArticleInfo({super.key});
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.7,
                width: double.infinity,
                child: cachedNetworkSpinkit(
                    homeScreenController.economyList.value[1].urlToImage!),
              ),
            ),
            Positioned(
              bottom: 0,
              top: 230,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homeScreenController.fashionList.value[1].title!,
                          style: theme.titleLarge,
                        ),
                        Row(
                          children: [
                            const InkWell(
                                child: Icon(
                              CupertinoIcons.person_alt_circle_fill,
                              color: Colors.blueAccent,
                              size: 35,
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(homeScreenController
                                .fashionList.value[2].author!),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(homeScreenController
                                .fashionList.value[2].publishedAt!
                                .substring(0, 10)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            homeScreenController.fashionList.value[1].content!),
                        Text(
                            homeScreenController.fashionList.value[1].content!),
                        Text(
                            homeScreenController.fashionList.value[1].content!),
                        Text(
                            homeScreenController.fashionList.value[1].content!),
                        Text(
                            homeScreenController.fashionList.value[1].content!),
                        SizedBox(
                          height: 25,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.bookmark))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
