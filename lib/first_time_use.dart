import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnboardingScreen> {
  //controller tells what page we the user is in
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                      'https://assets8.lottiefiles.com/packages/lf20_lc46h4dr.json'),
                  Text('WELCOME TO THE UST ONE-STOP SHOP!!')
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                      'https://assets2.lottiefiles.com/packages/lf20_y3qfynfr.json'),
                  Text('ALL OF UST\u0027s SERVICES IN ONE PLATFORM!')
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                      'https://assets2.lottiefiles.com/packages/lf20_hk9b4dem.json'),
                  Text('LET\u0027s GET CONNECTED THOMASIAN!')
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('START CONNECTING NOW!'),
                  Image.asset(
                    'assets/images/ust_statue.png',
                    height: 370,
                    width: 450,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(254, 192, 15, 1)),
                    onPressed: () {},
                    child: Text('LOGIN'),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
            alignment: Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: WormEffect(
                dotColor: Color.fromRGBO(254, 220, 121, 1),
                activeDotColor: Color.fromRGBO(254, 192, 15, 1),
              ),
            ))
      ],
    ));
  }
}
