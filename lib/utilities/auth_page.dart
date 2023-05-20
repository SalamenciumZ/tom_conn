import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tom_conn/homepage.dart';
import 'package:tom_conn/utilities/logInOrRegister.dart';
import 'package:tom_conn/verifyEmail.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            if (!FirebaseAuth.instance.currentUser!.isAnonymous) {
              return VerifyEmail();
            } else {
              return HomeScreen();
            }
          }
          //user is not logged in
          else {
            return logInOrRegister();
          }
        },
      ),
    );
  }
}
