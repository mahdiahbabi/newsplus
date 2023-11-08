// ignore_for_file: file_names

import 'dart:developer';

import 'package:get/get.dart';

import '../component/ApiConstant.dart';
import '../model/newsmodel.dart';
import '../service/dioservice.dart';

class HomeScreenController extends GetxController {
  var apiKey = "d5a39792b3fc4d13958a512fd480179c";
  
  RxList<BreakingNewsModel> breakingNewslist = RxList();
  RxList<BreakingNewsModel> educationList = RxList();
  RxList<BreakingNewsModel> healthList = RxList();
  RxList<BreakingNewsModel> economyList = RxList();
  RxList<BreakingNewsModel> businessList = RxList();
  RxList<BreakingNewsModel> fashionList = RxList();
  RxList<BreakingNewsModel> sportList = RxList();

  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getArticleHomePage();
  }

  getArticleHomePage() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.baseapi + apiKey);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      int count = 0;
      response.data["articles"].forEach((element) {
        if (count < 37) {
          breakingNewslist.add(BreakingNewsModel.fromjson(element));
          count++;
        }
      });
    }

    var responseedu =
        await DioService().getMethod(ApiConstant.articleEducation + apiKey);
    log(responseedu.statusCode.toString());
    if (responseedu.statusCode == 200) {
      int count = 0;
      responseedu.data["articles"].forEach((element) {
        if (count < 200) {
          educationList.add(BreakingNewsModel.fromjson(element));
          count++;
        }
      });
    }
    var responseHealth =
        await DioService().getMethod(ApiConstant.articleHealth + apiKey);
    log(responseHealth.statusCode.toString());
    if (responseHealth.statusCode == 200) {
      int count = 0;
      responseHealth.data["articles"].forEach((element) {
        if (count < 200) {
          healthList.add(BreakingNewsModel.fromjson(element));
          count++;
        }
      });
    }
    var responseEconomy =
        await DioService().getMethod(ApiConstant.articleEconomy + apiKey);
    log(responseEconomy.statusCode.toString());
    if (responseEconomy.statusCode == 200) {
      int count = 0;
      responseEconomy.data["articles"].forEach((element) {
        if (count < 200) {
          economyList.add(BreakingNewsModel.fromjson(element));
          count++;
        }
      });
    }
    var responseBusiness =
        await DioService().getMethod(ApiConstant.articleBusiness + apiKey);
    log(responseBusiness.statusCode.toString());
    if (responseBusiness.statusCode == 200) {
      int count = 0;
      responseBusiness.data["articles"].forEach((element) {
        if (count < 200) {
          businessList.add(BreakingNewsModel.fromjson(element));

          count++;
        }
      });
    }
    var responseFashion =
        await DioService().getMethod(ApiConstant.articleFashion + apiKey);
    log(responseFashion.statusCode.toString());
    if (responseFashion.statusCode == 200) {
      int count = 0;
      responseFashion.data["articles"].forEach((element) {
        if (count < 200) {
          fashionList.add(BreakingNewsModel.fromjson(element));

          count++;
        }
       
      });
    }

    var responseSport =
        await DioService().getMethod(ApiConstant.articleSport + apiKey);
    log(responseSport.statusCode.toString());
    if (responseSport.statusCode == 200) {
      int count = 0;
      responseSport.data["articles"].forEach((element) {
        if (count < 200) {
          sportList.add(BreakingNewsModel.fromjson(element));

          count++;
        }
      });
    }

    loading.value = false;
  }
}
