
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsplus/component/MyString.dart';
import 'package:newsplus/view/HomeScreen.dart';

import '../gen/assets.gen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
      TextTheme theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amberAccent,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: Assets.image.r.image().image,
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              Positioned(
                bottom: 200,
                left: 90,
                right: 90,
                child: ElevatedButton(
                    onPressed: () {
                      bottomSheet(context,);
                    },
                    child: const Text('lets go',)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> bottomSheet(BuildContext context, ) {
    TextTheme theme = Theme.of(context).textTheme;
  
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: 
              MainAxisAlignment.spaceAround,
              children: [
                 Text(MyString.onbordingTitle,style:  theme.titleLarge,),
                 Text(MyString.onbordingDescription,style: theme.titleSmall,),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>  HomeScreen(),
                        ));
                  },
                  splashColor: Colors.amberAccent,
                  color: Colors.blueAccent,
                  child: const SizedBox(
                    child: SizedBox(
                      height: 30,
                      width: 90,
                      child: Row(
                        children: [
                          Text('Explor'),
                          Icon(CupertinoIcons.arrow_right)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
