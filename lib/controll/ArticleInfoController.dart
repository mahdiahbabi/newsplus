

import 'package:get/get.dart';
import 'package:newsplus/model/newsmodel.dart';

class ArticleInfoController extends GetxController{
  Rx<BreakingNewsModel> ArticleInfo = BreakingNewsModel().obs;




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}