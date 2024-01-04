import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../model/hiveModel.dart';
import 'ArticleInfo.dart';

class BookMark extends StatefulWidget {
  const BookMark({super.key});

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  final articleBox = Hive.box<HiveModel>('mybox');

  @override
  Widget build(BuildContext context) {
    final List<HiveModel> items = articleBox.values.toList();
    log(items[0].content);

    return Scaffold(
      appBar: AppBar(title: const Text('bookmark')),
      body: Container(
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
      ),
    );
  }

  homePageArticle({
    required HiveModel item,
    required BuildContext context,
    required int index,
  }) {
    return GestureDetector(
      onDoubleTap: () {
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
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 18,
                          
                          overflow: TextOverflow.ellipsis,
                        ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item.author ?? 'justin potter',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 18,
                        ),
                    ),
                    const SizedBox(height: 10),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          articleBox.delete(item);
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
