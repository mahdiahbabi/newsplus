
import 'package:dio/dio.dart';

class DioService{





Dio dio = Dio();


Future<dynamic> getMethod(String url)async{
  var response = await dio.get(url);
  // print(response);
  return response;
  
}
  
}