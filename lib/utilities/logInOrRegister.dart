import 'package:flutter/material.dart';
import 'package:tom_conn/login.dart';
import 'package:tom_conn/register.dart';

class logInOrRegister extends StatefulWidget {
  const logInOrRegister({super.key});
  @override
  State<logInOrRegister> createState() => _logInOrRegisterState();
}

class _logInOrRegisterState extends State<logInOrRegister> {
  bool showLogin = true;
  void toggle() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Login(onTap: toggle);
    } else {
      return Register(onTap: toggle);
    }
  }
}
