import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tom_conn/homepage.dart';
import 'package:tom_conn/settings.dart';
import 'package:tom_conn/settingsList.dart';
import 'package:tom_conn/utilities/getWH.dart';

class aboutUs extends StatefulWidget {
  const aboutUs({Key? key}) : super(key: key);

  @override
  State<aboutUs> createState() => _aboutUs();
}

class _aboutUs extends State<aboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFFfec00f),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const settingsList()),
            );
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(3),
            child: Image.asset('assets/images/ust_logo.png'),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/about_us_BG.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      bottomNavigationBar: GNav(
        selectedIndex: 1,
        backgroundColor: Color(0xFF121212),
        color: Colors.white,
        activeColor: Color(0xFFfec00f),
        gap: 10,
        tabMargin: EdgeInsets.only(left: 10, right: 10),
        tabs: [
          GButton(icon: Icons.home, text: 'Home',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }),
          GButton(icon: Icons.settings, text: 'Settings',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const settingsList()),
                );
              }),
          GButton(icon: Icons.logout, text: 'Log Out',
              onPressed: () {
                _confirmLogout();
              }),
        ],
      ),
    );
  }

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirm Log Out"),
          content: Text(
              "Do you want to log out?"),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
              child: Text("Yes"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
