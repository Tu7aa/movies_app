import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/screens/auth/login_screen.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/themes/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), navigator);
  }

  void navigator() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return  LoginPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child:Image.asset('assets/images/popcorn.png')
      ),
    );
  }
}
