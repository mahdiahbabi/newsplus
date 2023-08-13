
import 'package:flutter/material.dart';
import 'package:newsplus/view/mainScreen.dart';

import 'view/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home:  MainScreen(),
    );
  }
}

