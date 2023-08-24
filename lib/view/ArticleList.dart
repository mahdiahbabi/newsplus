// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsplus/model/newsmodel.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({super.key, required this.list});
  final List<BreakingNewsModel> list;
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fashion'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemCount: list.length,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8)),
                //  color: Colors.amberAccent,
                height: 150,

                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index].title ?? 'lord',
                            style: theme.titleSmall!.copyWith(fontSize: 18),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            list[index].author ?? 'justin potter',
                            style: theme.titleSmall!.copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            list[index].name!,
                            style: theme.titleSmall!.copyWith(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: list[index].urlToImage ?? '',
                      height: 150,
                      width: 150,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      placeholder: (context, url) =>
                          const SpinKitCubeGrid(color: Colors.pink),
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.image_not_supported_rounded);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
