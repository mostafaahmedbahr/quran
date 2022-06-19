import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'login/login_screen.dart';
 class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(
        const Duration(seconds: 5),(){
      Navigator.push(context,MaterialPageRoute(
        builder: (context)=>  QuranLoginScreen(),
      ),
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:Scaffold(
        backgroundColor: Colors.white,
        body:Center(
          child: Text("ألقران الكريم",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: Colors.deepOrange,
            fontFamily: "Blaka",
          ),),
        ),
      ),
    );
  }
}
