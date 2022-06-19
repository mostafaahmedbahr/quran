import 'dart:async';

import 'package:flutter/material.dart';

import 'misbaha_layout.dart';
 class MisbahaSplashScreen extends StatefulWidget {
  const MisbahaSplashScreen({Key? key}) : super(key: key);

  @override
  State<MisbahaSplashScreen> createState() => _MisbahaSplashScreenState();
}

class _MisbahaSplashScreenState extends State<MisbahaSplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(
        const Duration(seconds: 5),(){
      Navigator.push(context,MaterialPageRoute(
        builder: (context)=>MisbahaLayout(),
      ),
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/ms3.jpg",),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(5,5),
                    ),
                  ],
                ),

                child: const Align(
                  heightFactor: 1,
                  child: Text("عن أبي هريرة -رضي الله عنه- قال: قال رسول الله -صلّى الله عليه وسلّم-: (خُذُوا جُنَّتَكُمْ مِنَ النارِ؛ قولوا: سبحانَ اللهِ، والحمدُ للهِ، ولَا إلهَ إلَّا اللهِ، واللهُ أكبرُ، فإِنَّهنَّ يأتينَ يومَ القيامةِ مُقَدِّمَاتٍ وَمُعَقِّبَاتٍ وَمُجَنِّبَاتٍ، وَهُنَّ الْبَاقِيَاتُ الصَّالِحَات).ُ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}