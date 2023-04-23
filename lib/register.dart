import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tom_conn/utilities/getWH.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();
  void signUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      //checks if pw and confirmed pw is the same
      if (passwordController.text == confirmedPasswordController.text &&
          emailController.text.contains('@ust.edu.ph')) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
      } else {
        if (passwordController.text != confirmedPasswordController.text) {
          showError('Passwords do not Match!');
        } else {
          showError('Enter UST Email!');
        }
      }
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        showError(e.code);
      } else if (e.code == 'wrong-password') {
        showError(e.code);
      }
    }
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(255, 179, 0, 1),
          title: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              reverse: true,
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/tomasino_connect_logo.png',
                          height: getScreenHeight(context) * 0.3,
                          width: getScreenWidth(context) * 0.4,
                          fit: BoxFit.fitHeight,
                        ),
                        Column(
                          children: [
                            Text(
                              'TOMASINO',
                              style: TextStyle(
                                  fontSize: getScreenWidth(context) * 0.055,
                                  fontFamily: 'Neo-Syber',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              'CONNECT',
                              style: TextStyle(
                                fontSize: getScreenWidth(context) * 0.055,
                                fontFamily: 'Neo-Syber',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: getScreenHeight(context) * 0.00001),
                    AutoSizeText(
                      "Create an Account!",
                      style: TextStyle(
                        fontSize: getScreenWidth(context) * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getScreenHeight(context) * 0.020),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'UST EMAIL',
                          hintStyle: TextStyle(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.7019607843137254)),
                          prefixIcon: Icon(CupertinoIcons.person_fill),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.7019607843137254)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getScreenHeight(context) * 0.020),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'PASSWORD',
                          hintStyle: TextStyle(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.7019607843137254)),
                          prefixIcon: Icon(CupertinoIcons.lock_fill),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.7019607843137254)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getScreenHeight(context) * 0.020),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextField(
                        controller: confirmedPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'CONFIRM PASSWORD',
                          hintStyle: TextStyle(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.7019607843137254)),
                          prefixIcon: Icon(CupertinoIcons.lock_fill),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.7019607843137254)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getScreenHeight(context) * 0.020),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(340, 40),
                          backgroundColor:
                              const Color.fromRGBO(255, 179, 0, 1)),
                      onPressed: () {
                        signUp();
                      },
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getScreenWidth(context) * 0.045,
                        ),
                      ),
                    ),
                    SizedBox(height: getScreenHeight(context) * 0.010),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an Account?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: getScreenWidth(context) * 0.035),
                        ),
                        SizedBox(
                          width: getScreenWidth(context) * 0.010,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            'Login Now.',
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 161, 228, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.035,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
