
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newsplus/view/MainScreen.dart';

import 'model/hiveModel.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(HiveModelAdapter());
  var faveritArticle =  await Hive.openBox<HiveModel>('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        titleSmall: TextStyle(fontSize: 25,fontWeight: FontWeight.w300),
        
       ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:   MainScreen(),
    );
  }
}

