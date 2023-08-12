



import 'dart:developer';

import 'package:get/get.dart';
import 'package:newsplus/component/ApiConstant.dart';
import 'package:newsplus/model/newsmodel.dart';
import 'package:newsplus/service/dioservice.dart';

class HomeScreenController extends GetxController{

RxList<BreakingNewsModel> Breakingnewslist = RxList(); 


@override
onInit(){
  super.onInit();
  getArticleHomePage();
}

getArticleHomePage()async{
var response = await DioService().getMethod(ApiConstant.baseapi);
log(response.statusCode.toString());
if(response.statusCode == 200){
  response.data["articles"].forEach((element){
    Breakingnewslist.add(BreakingNewsModel.fromjson(element));
    
  });
}
log(Breakingnewslist.value[1].title!);
}

}