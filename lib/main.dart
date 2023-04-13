import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tom_conn/first_time_use.dart';
import 'package:tom_conn/homepage.dart';
import 'package:tom_conn/login.dart';
import 'package:tom_conn/loading_screen.dart';
import 'package:tom_conn/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Header Example',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => Login(),
        '/loading': (context) => LoadingPage(),
        '/onboarding': (context) => OnboardingScreen(),
        '/settings': (context) => settings(),
      },
    );
  }
}
