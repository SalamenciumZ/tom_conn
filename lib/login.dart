import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tom_conn/utilities/getWH.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utilities/all_platform.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _captchaFormKey = GlobalKey<FormState>();
  final _configFormKey = GlobalKey<FormState>();
  final _localCaptchaController = LocalCaptchaController();
  final _configFormData = ConfigFormData();

  var _inputCode = '';

  void signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        showError("User does not exists.");
      } else if (e.code == 'wrong-password') {
        showError("Invalid Password");
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

  signInAnonymously() async {
    await FirebaseAuth.instance.signInAnonymously();
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
                      "Start Connecting!",
                      style: TextStyle(
                        fontSize: getScreenWidth(context) * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getScreenHeight(context) * 0.036),
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
                    SizedBox(height: getScreenHeight(context) * 0.030),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(340, 60),
                          backgroundColor:
                              const Color.fromRGBO(255, 179, 0, 1)),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildCaptcha(context),
                        );
                        //signIn();
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getScreenWidth(context) * 0.045,
                        ),
                      ),
                    ),
                    SizedBox(height: getScreenHeight(context) * 0.040),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            signInAnonymously();
                          },
                          child: Text(
                            'Sign in as Guest.',
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 161, 228, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.035,
                            ),
                          ),
                        ),
                        SizedBox(width: getScreenWidth(context) * 0.2),
                        GestureDetector(
                          onTap: widget.onTap,
                          //widget.onTap,
                          child: Text(
                            'Register Now.',
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 161, 228, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.035,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dispose() {
    _localCaptchaController.dispose();

    super.dispose();
  }

  Widget _buildCaptcha(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: 300.0,
            child: Form(
              key: _captchaFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LocalCaptcha(
                    key: ValueKey(_configFormData.toString()),
                    controller: _localCaptchaController,
                    height: 150,
                    width: 300,
                    backgroundColor: Colors.grey[100]!,
                    chars: _configFormData.chars,
                    length: _configFormData.length,
                    fontSize: _configFormData.fontSize > 0 ? _configFormData.fontSize : null,
                    caseSensitive: _configFormData.caseSensitive,
                    codeExpireAfter: _configFormData.codeExpireAfter,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter code',
                      hintText: 'Enter code',
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        if (value.length != _configFormData.length) {
                          return '* Code must be length of ${_configFormData.length}.';
                        }

                        final validation = _localCaptchaController.validate(value);

                        switch (validation) {
                          case LocalCaptchaValidation.invalidCode:
                            return '* Invalid code.';
                          case LocalCaptchaValidation.codeExpired:
                            return '* Code expired.';
                          case LocalCaptchaValidation.valid:
                          default:
                            return null;
                        }
                      }

                      return '* Required field.';
                    },
                    onSaved: (value) => _inputCode = value ?? '',
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_captchaFormKey.currentState?.validate() ?? false) { // If Correct
                          _captchaFormKey.currentState!.save();
                          signIn();
                          Navigator.of(context).pop();
                        }
                        else if (_captchaFormKey.currentState?.validate() == false) { // if wrong
                          _localCaptchaController.refresh();
                        }
                      },
                      child: const Text('Validate Code'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFfec00f),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _localCaptchaController.refresh(),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                      ),
                      child: const Text('Refresh'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // body: LocalCaptcha(),
    );
  }
}

class ConfigFormData {
  String chars = 'abdefghnryABDEFGHNQRY3468';
  int length = 5;
  double fontSize = 0;
  bool caseSensitive = false;
  Duration codeExpireAfter = const Duration(minutes: 10);

  @override
  String toString() {
    return '$chars$length$caseSensitive${codeExpireAfter.inMinutes}';
  }
}
