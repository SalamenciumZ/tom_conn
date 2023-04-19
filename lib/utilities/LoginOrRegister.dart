import 'package:flutter/material.dart';
import 'package:tom_conn/login.dart';
import 'package:tom_conn/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});
  @override
  State<LoginOrRegister> createState() => _LoginOrRegister();
}

class _LoginOrRegister extends State<LoginOrRegister> {
  bool showLogin = true;

  void togglePage() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Login(onTap: togglePage);
    } else {
      return Register(onTap: togglePage);
    }
  }
}
