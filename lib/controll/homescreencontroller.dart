

import 'dart:developer';

import 'package:get/get.dart';

import '../component/ApiConstant.dart';
import '../model/newsmodel.dart';
import '../service/dioservice.dart';

class HomeScreenController extends GetxController{

RxList<BreakingNewsModel> breakingNewslist = RxList(); 
RxList<BreakingNewsModel> educationList = RxList(); 
RxList<BreakingNewsModel> healthList = RxList(); 
RxList<BreakingNewsModel> economyList = RxList(); 
RxList<BreakingNewsModel> businessList = RxList(); 
RxList<BreakingNewsModel> fashionList = RxList(); 
RxList<BreakingNewsModel> sportList = RxList(); 


 RxBool loading = false.obs;

@override
onInit(){
  super.onInit();
  getArticleHomePage();
}

getArticleHomePage()async{
 loading.value = true;
var response = await DioService().getMethod(ApiConstant.baseapi);
log(response.statusCode.toString());
if(response.statusCode == 200){
  response.data["articles"].forEach((element){
    breakingNewslist.add(BreakingNewsModel.fromjson(element));
    
  });
}


var responseedu = await DioService().getMethod(ApiConstant.articleEducation);
log(responseedu.statusCode.toString());
if(responseedu.statusCode == 200){
  responseedu.data["articles"].forEach((element){
    educationList.add(BreakingNewsModel.fromjson(element));
    
  });
}
var responseHealth = await DioService().getMethod(ApiConstant.articleHealth);
log(responseHealth.statusCode.toString());
if(responseHealth.statusCode == 200){
  responseHealth.data["articles"].forEach((element){
    healthList.add(BreakingNewsModel.fromjson(element));
    
  });
}
var responseEconomy = await DioService().getMethod(ApiConstant.articleEconomy);
log(responseEconomy.statusCode.toString());
if(responseEconomy.statusCode == 200){
  responseEconomy.data["articles"].forEach((element){
    economyList.add(BreakingNewsModel.fromjson(element));
    
  });
}
var responseBusiness = await DioService().getMethod(ApiConstant.articleBusiness);
log(responseBusiness.statusCode.toString());
if(responseBusiness.statusCode == 200){
  responseBusiness.data["articles"].forEach((element){
    businessList.add(BreakingNewsModel.fromjson(element));
    
  });
}
var responseFashion = await DioService().getMethod(ApiConstant.articleFashion);
log(responseFashion.statusCode.toString());
if(responseFashion.statusCode == 200){
  responseFashion.data["articles"].forEach((element){
    fashionList.add(BreakingNewsModel.fromjson(element));
    
  });
}

var responseSport = await DioService().getMethod(ApiConstant.articleSport);
log(responseSport.statusCode.toString());
if(responseSport.statusCode == 200){
  responseSport.data["articles"].forEach((element){
    sportList.add(BreakingNewsModel.fromjson(element));
    
  });
}

loading.value = false;
}

}