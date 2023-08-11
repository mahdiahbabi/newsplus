

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsplus/view/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => Onboarding(),)));
  }
  @override
  Widget build(BuildContext context) {
    return  const SafeArea(child: Center(child: SpinKitFadingCube(color: Colors.amberAccent)),);
  }
}