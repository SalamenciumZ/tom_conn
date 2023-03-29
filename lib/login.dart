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
                  SizedBox(height: getScreenHeight(context) * 0.060),
                  AutoSizeText(
                    "TOMASINO CONNECT",
                    style: TextStyle(
                      fontSize: getScreenWidth(context) * 0.075,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getScreenHeight(context) * 0.060),
                  AutoSizeText(
                    "Start Connecting!",
                    style: TextStyle(
                      fontSize: getScreenWidth(context) * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getScreenHeight(context) * 0.060),
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
                  SizedBox(height: getScreenHeight(context) * 0.040),
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
                  SizedBox(height: getScreenHeight(context) * 0.060),
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
                            color: Color.fromRGBO(254, 192, 15, 1),
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
