

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget cachedNetworkSpinkit(String url){
  return CachedNetworkImage(imageUrl: url,
  imageBuilder: (context, imageProvider) {
   return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: imageProvider),
      ),
    );
  },
  placeholder: (context, url) => const SpinKitFadingCube(color: Colors.amberAccent),
  errorWidget: (context, url, error) => const Icon(CupertinoIcons.photo_on_rectangle),
  );
}