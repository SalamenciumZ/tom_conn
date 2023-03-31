import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tom_conn/utilities/getWH.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/tiger_logo.png',
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
                                color: Colors.white),
                          ),
                          Text(
                            'CONNECT',
                            style: TextStyle(
                              fontSize: getScreenWidth(context) * 0.055,
                              fontFamily: 'Neo-Syber',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'USERNAME',
                        prefixIcon: Icon(CupertinoIcons.person_fill),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: getScreenHeight(context) * 0.020),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'PASSWORD',
                        prefixIcon: Icon(CupertinoIcons.lock_fill),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: getScreenHeight(context) * 0.030),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(340, 60),
                        backgroundColor: Color.fromRGBO(255, 179, 0, 1)),
                    onPressed: () {},
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
                      Text(
                        'Dont have a UST Account? Enter as a',
                        style: TextStyle(
                          fontSize: getScreenWidth(context) * 0.035,
                        ),
                      ),
                      SizedBox(width: getScreenWidth(context) * 0.010),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Text(
                          'guest.',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 179, 0, 1),
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
        ],
      ),
    );
  }
}
