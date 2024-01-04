import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newsplus/component/MyString.dart';
import 'package:newsplus/controll/ArticleInfoController.dart';
import 'package:newsplus/gen/assets.gen.dart';
import 'package:newsplus/model/newsmodel.dart';
import '../model/hiveModel.dart';
import 'ArticleInfo.dart';

class BookMark extends StatefulWidget {
  BookMark({super.key});

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  final articleBox = Hive.box<HiveModel>('mybox');
  ArticleInfoController articleInfoController =
      Get.put(ArticleInfoController());
  @override
  Widget build(BuildContext context) {
    final List<HiveModel> items = articleBox.values.toList();

    return Scaffold(
        appBar: AppBar(title: const Text('bookmark')),
        body: items.isNotEmpty
            ? SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: items.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return homePageArticle(
                      item: item,
                      context: context,
                      index: index,
                    );
                  },
                ),
              )
            :  SizedBox(
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.bookmark,
                      size: 80,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(MyString.bookmark, style: Theme.of(context).textTheme.bodyLarge,),
                  ],
                )),
              ));
  }

  homePageArticle({
    required HiveModel item,
    required BuildContext context,
    required int index,
  }) {
    return GestureDetector(
      onTap: () async {
        BreakingNewsModel breakingNewsModel = BreakingNewsModel(
          author: item.author ?? '',
          content: item.content ?? '',
          description: item.description ?? '',
          id: '',
          name: item.name ?? '',
          publishedAt: item.publishedAt ?? '2024-01-03',
          title: item.title ?? '',
          url: item.urlToImage ?? '',
          urlToImage: item.urlToImage ?? '',
        );

        articleInfoController.ArticleInfo.value = breakingNewsModel;
        log(articleInfoController.ArticleInfo.value.publishedAt!);
        Get.to(ArticleInfo());
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      
                      item.author ?? 'justin potter',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18,
                            
                          ),
                    ),
                    const SizedBox(height: 18),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          articleBox.deleteAt(index);
                        });
                      },
                      icon: const Icon(CupertinoIcons.bookmark_fill),
                    ),
                  ],
                ),
              ),
            ),
            CachedNetworkImage(
              imageUrl: item.urlToImage,
              height: 150,
              width: 150,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              placeholder: (context, url) =>
                  const SpinKitCubeGrid(color: Colors.pink),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
