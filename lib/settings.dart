import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:tom_conn/utilities/getWH.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
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
          onPressed: () {},
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
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Account Settings",
                style: TextStyle(
                    fontSize: getScreenWidth(context) * 0.06,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: getScreenHeight(context) * 0.0025,
              ),
              Center(
                child: Stack(
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
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: getScreenHeight(context) * 0.09,
                        width: getScreenWidth(context) * 0.09,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Color(0xFFfec00f),
                        ),
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getScreenHeight(context) * 0.0035,
              ),
              buildTextField("First Name", "Juan", true),
              buildTextField("Last Name", "Dela Cruz", false),
              buildTextField("Affiliation", "Student", false),
              buildTextField("College", "CICS", false),
              SizedBox(
                height: getScreenHeight(context) * 0.0035,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFfec00f),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {},
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
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

  Widget buildTextField(String labelText, String placeholder, bool isObscure) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
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
            fontSize: getScreenWidth(context) * 0.039,
            fontWeight: FontWeight.bold,
            color: Color(0xFF857979),
          ),
        ),
      ),
    );
  }
}
