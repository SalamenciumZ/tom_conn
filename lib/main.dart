import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tom_conn/first_time_use.dart';
import 'package:tom_conn/homepage.dart';
import 'package:tom_conn/loading_screen.dart';
import 'package:tom_conn/accSettings.dart';
import 'package:tom_conn/settingsList.dart';
import 'package:tom_conn/editPW.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tom_conn/shop.dart';
import 'package:tom_conn/utilities/CoffeeShop.dart';
import 'package:tom_conn/utilities/ConvStore.dart';
import 'package:tom_conn/utilities/FastFood.dart';
import 'package:tom_conn/utilities/auth_page.dart';
import 'package:tom_conn/utilities/newFoodList.dart';
import 'firebase_options.dart';

int? isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onboarding');
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
      home: isViewed != 0 ? OnboardingScreen() : LoadingPage(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/loading': (context) => LoadingPage(),
        '/onboarding': (context) => OnboardingScreen(),
        '/settings': (context) => const settingsList(),
        '/accSettings': (context) => settings(),
        '/editPW': (context) => editPW(),
        '/auth': (context) => AuthPage(),
        '/food': (context) => newFoodListPage(),
        '/convenientStores': (context) => ConvStore(),
        '/fastFood': (context) => FastFood(),
        '/coffeeShop': (context) => CoffeeShop(),
        '/shop': (context) => Shops(),
      },
    );
  }
}
