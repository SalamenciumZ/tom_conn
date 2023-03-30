import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

import 'package:tom_conn/first_time_use.dart';

void main() {
  runApp(new LoadingPage());
}

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/LoadingScreen.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child:
              Lottie.asset('assets/images/loading.json', height: 70, width: 70),
        ),
      ),
    );
  }
}
