


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../model/hiveModel.dart';
import 'ArticleInfo.dart';
HiveModel hiveArticle = HiveModel();
class BookMark extends StatefulWidget {
   BookMark({super.key});

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
final articleBox = Hive.box<HiveModel>('mybox');

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('bookmark')),
      body: Container(
        color: Colors.redAccent,
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          
          itemCount: articleBox.keys.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            HiveModel articleModel = articleBox.values.toList()[index];
          return homePageArticle( textTheme: theme, context: context, index: index, image: articleModel.urlToImage, title: articleModel.title, publishedAt: articleModel.publishedAt , author: articleModel.author, content: articleModel.content);
        },),
      ),
    );
  }
  
 homePageArticle(
      {String? author,
      required TextTheme textTheme ,
      required context,
      required int index,
      required String content,
      required String image,
      required String title,
      required String publishedAt}) {
        final articleBox = Hive.box<HiveModel>('mybox');
     GestureDetector(
      //TODO:  انتقال این بخش در صورت کار نکردن به خود لیست
      onDoubleTap: () {
        
        Get.to(ArticleInfo());
      },
      child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8)),
                  //  color: Colors.amberAccent,
                  height: 165,
            
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title ,
                                style: textTheme.titleSmall!.copyWith(fontSize: 18),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                               author ?? 'justin potter',
                                style: textTheme.titleSmall!.copyWith(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              IconButton(onPressed: (){
setState(() {
  articleBox.delete(hiveArticle);
}

);



                              }, icon: Icon(CupertinoIcons.bookmark_fill))
                        
                            ],
                          ),
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl: image ,
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
              ),
    );
  }


}


