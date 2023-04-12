import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:tom_conn/editPW.dart';
import 'package:tom_conn/homepage.dart';
import 'package:tom_conn/settings.dart';

class settingsList extends StatefulWidget {
  const settingsList({Key? key}) : super(key: key);

  @override
  State<settingsList> createState() => _settingsListState();
}

class _settingsListState extends State<settingsList> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF121212),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        backgroundColor: Color(0xFFfec00f),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(3),
            child: Image.asset('assets/images/ust_logo.png'),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox( //controls the size of the background of the avatar
              height: 15,
            ),
            Center( //the avatar. want to put fixed/max image size to avoid
              child: Stack( //problems with the sized box above
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Color(0xFF121212).withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/default_avatar.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SettingsGroup(title: 'ACCOUNT',
                children: <Widget>[
                  buildAccount(),
                  buildPassword(),
                  buildLogout(),
                ],
            ),
            const SizedBox(height: 32),
            SettingsGroup(title: 'INFO',
              children: <Widget>[
                buildDisclaimer(),
                buildAboutUs(),
                buildContactUs(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Color(0xFF121212),
        color: Colors.white,
        activeColor: Color(0xFFfec00f),
        gap: 4,
        tabs: [
          GButton(icon: Icons.settings, text: 'Settings'),
          GButton(icon: Icons.copyright, text: 'Disclaimer'),
          GButton(icon: Icons.info, text: 'About Us'),
          GButton(icon: Icons.phone, text: 'Contact Us'),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isObscure) { //the TextFIeld for the inputs
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: TextField(
        obscureText: isObscure ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isObscure
              ? IconButton(
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(Icons.remove_red_eye),
            color: Colors.grey,
          )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF857979),
          ),
        ),
      ),
    );
  }

  Widget buildLogout() => SimpleSettingsTile(
    leading: IconButton(
      icon: const Icon(Icons.logout),
      color: Colors.blueAccent,
      onPressed: () {
        //Do something
      },
    ),
      title: 'Logout',
  subtitle: '',
  onTap: () {
      //Do something or logout

},
);

  Widget buildAccount() => SimpleSettingsTile(
    leading: IconButton(
      icon: const Icon(Icons.person),
      color: Colors.green,
      onPressed: () {
        //Do something
      },
    ),
    title: 'Account Settings',
    subtitle: 'Name, Affiliation, College',
    //Add container child to put '>' icon in the list
    onTap: () {
      //Do something or logout
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const settings()),
      );
    },
  );

  Widget buildPassword() => SimpleSettingsTile(
    leading: IconButton(
      icon: const Icon(Icons.password),
      color: Colors.black,
      onPressed: () {
        //Do something
      },
    ),
    title: 'Change Password',
    subtitle: '',
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const editPW()),
      );
    },
  );

  Widget buildDisclaimer() => SimpleSettingsTile(
    leading: IconButton(
      icon: const Icon(Icons.copyright),
      color: Colors.deepOrange,
      onPressed: () {
        //Do something
      },
    ),
    title: 'Disclaimer',
    subtitle: '',
    onTap: () {
      //Do something or logout
    },
  );

  Widget buildAboutUs() => SimpleSettingsTile(
    leading: IconButton(
      icon: const Icon(Icons.info),
      color: Colors.grey,
      onPressed: () {
        //Do something
      },
    ),
    title: 'About Us',
    subtitle: '',
    onTap: () {
      //Do something or logout
    },
  );

  Widget buildContactUs() => SimpleSettingsTile(
    leading: IconButton(
      icon: const Icon(Icons.phone),
      color: Colors.purple,
      onPressed: () {
        //Do something
      },
    ),
    title: 'Contact Us',
    subtitle: '',
    onTap: () {
      //Do something or logout
    },
  );
}
