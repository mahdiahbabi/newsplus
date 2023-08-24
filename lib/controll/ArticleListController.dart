


// import 'dart:developer';

// import 'package:get/get.dart';
// import 'package:newsplus/model/newsmodel.dart';

// import '../component/ApiConstant.dart';
// import '../service/dioservice.dart';

// class ArticleListController extends GetxController{
// RxList<BreakingNewsModel> articleList = RxList();
// RxString articleListAppBarTittle = ''.obs;
//  RxBool loading = false.obs;
//   @override
//   onInit() {
//     super.onInit();
//     getArticleHomePage();
//   }
//   var apiKey = "d5a39792b3fc4d13958a512fd480179c";
//   getArticleHomePage() async {
//     loading.value = true;
//     var response = await DioService().getMethod(ApiConstant.baseapi + apiKey);
//     log(response.statusCode.toString());
//     if (response.statusCode == 200) {
//       int count = 0;
//       response.data["articles"].forEach((element) {
//         if (count < 37) {
//           articleList.add(BreakingNewsModel.fromjson(element));
//           count++;
//         }
//       });
//     }

//   }}
