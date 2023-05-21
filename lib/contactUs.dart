import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tom_conn/homepage.dart';
import 'package:tom_conn/accSettings.dart';
import 'package:tom_conn/settingsList.dart';
import 'package:tom_conn/utilities/auth_page.dart';
import 'package:tom_conn/utilities/getWH.dart';
import 'package:flutter/services.dart';

class contactUs extends StatefulWidget {
  const contactUs({Key? key}) : super(key: key);

  @override
  State<contactUs> createState() => _contactUs();
}

class _contactUs extends State<contactUs> {
  @override
  Widget build(BuildContext context) {
    const emailSB = SnackBar(
      content: Text('Copied contact email!'),
    );

    const phoneSB = SnackBar(
      content: Text('Copied phone number!'),
    );

    const fbSB = SnackBar(
      content: Text('Copied FaceBook link'),
    );

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
            image: AssetImage("assets/images/contact_us_BG.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      color: Color(0xFFffffff),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/ust_logo.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 60,
                    width: 225,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Clipboard.setData(
                            ClipboardData(text: "sample@ust.edu.ph"));
                        // copied successfully
                        ScaffoldMessenger.of(context).showSnackBar(emailSB);
                      },
                      child: Text(
                        'Email: sample@ust.edu.ph',
                        style: TextStyle(
                          color: Color(0xFF121212),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(5.0),
                          primary: Color(0xFFffffff).withOpacity(0.0),
                          side: BorderSide(color: Colors.black87, width: 2),
                          shape: StadiumBorder()),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 60,
                    width: 225,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Clipboard.setData(
                            ClipboardData(text: "09876543210"));
                        // copied successfully
                        ScaffoldMessenger.of(context).showSnackBar(phoneSB);
                      },
                      child: Text(
                        'Phone Number: 09876543210',
                        style: TextStyle(
                          color: Color(0xFF121212),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(5.0),
                          primary: Color(0xFFffffff).withOpacity(0.0),
                          side: BorderSide(color: Colors.black87, width: 2),
                          shape: StadiumBorder()),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 60,
                    width: 225,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(
                            text: "https://www.facebook.com/UST1611official"));
                        // copied successfully
                        ScaffoldMessenger.of(context).showSnackBar(fbSB);
                      },
                      child: Text(
                        'FaceBook Page: UST RCNAS',
                        style: TextStyle(
                          color: Color(0xFF121212),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(5.0),
                          primary: Color(0xFFffffff).withOpacity(0.0),
                          side: BorderSide(color: Colors.black87, width: 2),
                          shape: StadiumBorder()),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
          GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthPage()),
                );
              }),
          GButton(
              icon: Icons.settings,
              text: 'Settings',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const settingsList()),
                );
              }),
          GButton(
              icon: Icons.logout,
              text: 'Log Out',
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
          content: Text("Do you want to log out?"),
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
