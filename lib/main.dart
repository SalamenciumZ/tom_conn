import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tom_conn/first_time_use.dart';
import 'package:tom_conn/homepage.dart';
import 'package:tom_conn/login.dart';
import 'package:tom_conn/loading_screen.dart';
import 'package:tom_conn/settings.dart';
import 'package:tom_conn/settingsList.dart';
import 'package:tom_conn/editPW.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tom_conn/utilities/auth_page.dart';
import 'firebase_options.dart';
import 'package:tom_conn/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldK = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldK,
      title: 'Header Example',
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      routes: {
        '/home': (context) => HomeScreen(),
        //'/login': (context) => Login(),
        //'/register': (context) => Register(),
        '/loading': (context) => LoadingPage(),
        '/onboarding': (context) => OnboardingScreen(),
        '/settings': (context) => const settingsList(),
        '/accSettings': (context) => settings(),
        '/editPW': (context) => editPW(),
      },
    );
  }
}
