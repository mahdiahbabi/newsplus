// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:newsplus/component/MyString.dart';
import '../component/MyColors.dart';
import '../controll/homescreencontroller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    var screenSize = MediaQuery.of(context).size;
    return Obx(
      () => homeScreenController.loading.value
          ? const SpinKitDualRing(color: Colors.amberAccent)
          : Scaffold(
              appBar: AppBar(
                title: const Text('mahdi'),
              ),
              body: SingleChildScrollView(
                child: SizedBox(
                  width: screenSize.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(MyString.homePageBreaking,
                            style: theme.titleMedium),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              homeScreenController.breakingNewslist.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: homePageArticle(
                                image: homeScreenController
                                    .breakingNewslist.value[index].urlToImage!,
                                title: homeScreenController
                                    .breakingNewslist.value[index].title!,
                                author: homeScreenController
                                    .breakingNewslist.value[index].author,
                                publishedAt: homeScreenController
                                    .breakingNewslist.value[index].publishedAt!,
                              ),
                            );
                          },
                        ),
                      ),
                      seeMore(context, theme,
                          seeMore: MyString.homePageHeath, catergortyindex: 1),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: homePageArticle(
                                image: homeScreenController
                                    .healthList.value[index].urlToImage!,
                                title: homeScreenController
                                    .healthList.value[index].title!,
                                author: homeScreenController
                                    .healthList.value[index].author,
                                publishedAt: homeScreenController
                                    .sportList.value[index].publishedAt!,
                              ),
                            );
                          },
                        ),
                      ),
                      seeMore(context, theme,
                          seeMore: MyString.homePageEducation,
                          catergortyindex: 2),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: homePageArticle(
                                image: homeScreenController
                                    .educationList.value[index].title!,
                                title: homeScreenController
                                    .educationList.value[index].title!,
                                author: homeScreenController
                                    .sportList.value[index].author,
                                publishedAt: homeScreenController
                                    .sportList.value[index].publishedAt!,
                              ),
                            );
                          },
                        ),
                      ),
                      seeMore(context, theme,
                          seeMore: MyString.homePageFashion,
                          catergortyindex: 3),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: homePageArticle(
                                  image: homeScreenController
                                      .fashionList.value[index].urlToImage!,
                                  title: homeScreenController
                                      .fashionList.value[index].title!,
                                  author: homeScreenController
                                      .fashionList.value[index].author,
                                  publishedAt: homeScreenController
                                      .fashionList.value[index].title!),
                            );
                          },
                        ),
                      ),
                      seeMore(context, theme,
                          seeMore: MyString.homePageSport, catergortyindex: 5),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: homePageArticle(
                                  image: homeScreenController
                                      .sportList.value[index].urlToImage!,
                                  title: homeScreenController
                                      .sportList.value[index].title!,
                                  author: homeScreenController
                                      .sportList.value[index].author,
                                  publishedAt: homeScreenController
                                      .sportList.value[index].publishedAt!),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Padding seeMore(BuildContext context, TextTheme theme,
      {required String seeMore, required int catergortyindex}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(MyString.homePageSport, style: theme.titleMedium),
          TextButton(
              onPressed: () {
                // switch (catergortyindex) {
                //   case 0: Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ,))

                //     break;
                //   default:
                // }
              },
              child: const Text(MyString.homePageSeeMore))
        ],
      ),
    );
  }

  Widget homePageArticle(
      {String? author,
      required String image,
      required String title,
      required String publishedAt}) {
    return Column(
      children: [
        //TODO:و تکست اضافه کردن عکس

        CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (context, imageProvider) => Stack(
            children: [
              Container(
                height: 230,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )),
                foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    gradient: const LinearGradient(
                        colors: GradientColor.homePageItemGradient,
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
              Positioned(
                  bottom: 30,
                  left: 10,
                  child: Text(author ?? ' james perterson'))
            ],
          ),
          height: 230,
          width: 250,
          placeholder: (context, url) =>
              const SpinKitFadingCircle(color: Colors.redAccent),
          errorWidget: (context, url, error) =>
              const Icon(Icons.image_not_supported_sharp,size: 50,),
        ),

        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
          ),
          child: SizedBox(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  publishedAt.substring(0, 10),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
