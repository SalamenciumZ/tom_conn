import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tom_conn/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tom_conn/utilities/getWH.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);
  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerification();

      //checks if email is verified
      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      if (FirebaseAuth.instance.currentUser!.isAnonymous) {
        isEmailVerified = true;
      }
    });

    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  Future sendVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    if (isEmailVerified) {
      return HomeScreen();
    } else {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A verification email has been sent to your email.',
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.030,
                  fontFamily: 'Satoshi',
                  color: Colors.black,
                ),
              ),
              Lottie.asset('assets/animations/email_sent.json'),
              SizedBox(height: getScreenHeight(context) * 0.035),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(254, 192, 15, 1)),
                onPressed: sendVerification,
                child: Text(
                  'RESEND EMAIL',
                  style: TextStyle(
                    fontSize: getScreenWidth(context) * 0.045,
                    fontFamily: 'Satoshi',
                  ),
                ),
              ),
              SizedBox(height: getScreenHeight(context) * 0.020),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  ;
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: const Color.fromRGBO(0, 161, 228, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: getScreenWidth(context) * 0.035,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
