import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:tom_conn/utilities/auth_page.dart';

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
          builder: (context) => AuthPage(),
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
