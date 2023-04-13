import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tom_conn/settingsList.dart';
import 'package:tom_conn/aboutUs.dart';

class editPW extends StatefulWidget {
  const editPW({Key? key}) : super(key: key);

  @override
  State<editPW> createState() => _editPass();
}

class _editPass extends State<editPW> {
  bool showPassword = false;
  TextEditingController cPasswordController = TextEditingController();
  TextEditingController nPasswordController = TextEditingController();
  TextEditingController cnPasswordController = TextEditingController();

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
              MaterialPageRoute(builder: (context) => const settingsList()),
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
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Change Password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField(cPasswordController, "Current Password", "********", true),
              buildTextField(nPasswordController, "New Password", "********", true),
              buildTextField(cnPasswordController, "Repeat New Password", "********", true),
              SizedBox(
                height: 35,
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
                    onPressed: () {
                      print(cPasswordController.text);
                      print(nPasswordController.text);
                      print(cnPasswordController.text);
                      cPasswordController.clear();
                      nPasswordController.clear();
                      cnPasswordController.clear();
                    },
                    child: Text("CLEAR",
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
        gap: 1,
        tabs: [
          GButton(icon: Icons.settings, text: 'Settings',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const settingsList()),
                );
              }),
          GButton(icon: Icons.copyright, text: 'Disclaimer',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const settingsList()),
                );
              }),
          // GButton(icon: Icons.info, text: 'Home',
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => HomeScreen()),
          //       );
          //     }),
          GButton(icon: Icons.info, text: 'About Us',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => aboutUs()),
                );
              }),
          GButton(icon: Icons.phone, text: 'Contact Us',
              onPressed: () {

              }),
        ],
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, labelText, String placeholder, bool isObscure) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: TextField(
        obscureText: isObscure ? showPassword : false,
        controller: controller,
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
}
