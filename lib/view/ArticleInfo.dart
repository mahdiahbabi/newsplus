// ignore_for_file: invalid_use_of_protected_member, must_be_immutable, iterable_contains_unrelated_type

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newsplus/component/widget.dart';
import 'package:newsplus/controll/ArticleInfoController.dart';
import 'package:newsplus/model/hiveModel.dart';

class ArticleInfo extends StatefulWidget {
  const ArticleInfo({
    super.key,
    
  });
 
  @override
  State<ArticleInfo> createState() => _ArticleInfoState();
}

class _ArticleInfoState extends State<ArticleInfo> {
  final hiveArticle = HiveModel();

  ArticleInfoController articleInfoController =
      Get.put(ArticleInfoController());

  @override
  bool ms  =false ;
  Widget build(BuildContext context) {
   
    final articleBox = Hive.box<HiveModel>('mybox');
      ms =articleBox.values.where((element) => element.name == hiveArticle.name).isNotEmpty;
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Obx(
        () => SizedBox(
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
                      articleInfoController.ArticleInfo.value.urlToImage!),
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
                            articleInfoController.ArticleInfo.value.title!,
                            style: theme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w300),
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
                              Expanded(
                                child: SizedBox(
                                  child: Text(
                                    articleInfoController
                                        .ArticleInfo.value.author!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(articleInfoController
                                  .ArticleInfo.value.publishedAt!
                                  .substring(0, 10)),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              articleInfoController.ArticleInfo.value.content!),
                          Text(
                              articleInfoController.ArticleInfo.value.content!),
                          Text(
                              articleInfoController.ArticleInfo.value.content!),
                          Text(
                              articleInfoController.ArticleInfo.value.content!),
                          Text(
                              articleInfoController.ArticleInfo.value.content!),
                          const SizedBox(
                            height: 25,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  hiveArticle.author = articleInfoController
                                          .ArticleInfo.value.author ??
                                      'cristin';
                                  hiveArticle.content = articleInfoController
                                          .ArticleInfo.value.content ??
                                      'this niews is emputy .  this niews is emputy . this niews is emputy .this niews is emputy .';
                                  hiveArticle.name = articleInfoController
                                          .ArticleInfo.value.name ??
                                      'mahdi';
                                  hiveArticle
                                      .description = articleInfoController
                                          .ArticleInfo.value.author ??
                                      ' this niews is emputy and you see default text from developer';
                                  hiveArticle.title = articleInfoController
                                          .ArticleInfo.value.title ??
                                      'cristin';
                                  hiveArticle.urlToImage = articleInfoController
                                          .ArticleInfo.value.urlToImage ??
                                      'https://avatars.githubusercontent.com/u/81352867?v=4?s=100';
                                  hiveArticle.publishedAt =
                                      articleInfoController
                                              .ArticleInfo.value.publishedAt ??
                                          '2024-01-01';

                                  // hiveArticle.url = articleInfoController
                                  //         .ArticleInfo.value.url ??
                                  //     'https://avatars.githubusercontent.com/u/81352867?v=4?s=100';

                                  if (hiveArticle.isInBox) {
                                    articleBox.delete(hiveArticle.name);
                                  }else {
                                    articleBox.put(hiveArticle.name,hiveArticle);
                                    
                                  }
                                },
                              );
                                 ms =articleBox.values.where((element) => element.name == hiveArticle.name).isNotEmpty;
                            },
                            icon: Icon(
                            ms 
                                ? CupertinoIcons.bookmark_fill
                                : CupertinoIcons.bookmark),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
