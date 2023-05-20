import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:tom_conn/utilities/getWH.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnboardingScreen> {
  //controller tells what page we the user is in
  PageController _controller = PageController();

  storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onboarding', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromRGBO(254, 192, 15, 1),
            padding: EdgeInsets.only(
                bottom: getScreenHeight(context) * 0.10,
                top: getScreenHeight(context) * 0.10),
            child: PageView(
              controller: _controller,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/animations/tiger_waving.json'),
                      Text(
                        'WELCOME TO THE UST ONE-STOP SHOP!!',
                        style: TextStyle(
                            fontSize: getScreenWidth(context) * 0.035,
                            fontFamily: 'Satoshi',
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/animations/smartphone.json',
                      ),
                      Text(
                        'ALL OF UST\u0027s SERVICES IN ONE PLATFORM!',
                        style: TextStyle(
                          fontSize: getScreenWidth(context) * 0.035,
                          fontFamily: 'Satoshi',
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/animations/services.json'),
                      Text(
                        'LET\u0027s GET CONNECTED THOMASIAN!',
                        style: TextStyle(
                          fontSize: getScreenWidth(context) * 0.035,
                          fontFamily: 'Satoshi',
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'START CONNECTING NOW!',
                        style: TextStyle(
                          fontSize: getScreenWidth(context) * 0.035,
                          fontFamily: 'Satoshi',
                          color: Colors.black,
                        ),
                      ),
                      Image.asset(
                        'assets/images/ust_statue.png',
                        height: getScreenHeight(context) * 0.5,
                        width: getScreenWidth(context) * 0.8,
                      ),
                      SizedBox(height: getScreenHeight(context) * 0.035),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(254, 192, 15, 1)),
                        onPressed: () async {
                          await storeOnBoardInfo();
                          Navigator.pushNamed(context, '/auth');
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: getScreenWidth(context) * 0.045,
                            fontFamily: 'Satoshi',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment(0, 0.73),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: WormEffect(
                dotColor: Color.fromRGBO(254, 220, 121, 1),
                activeDotColor: Color.fromRGBO(254, 192, 15, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
