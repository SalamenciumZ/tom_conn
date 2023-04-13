import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tom_conn/utilities/getWH.dart';
import 'package:round_icon/round_icon.dart';
import 'package:tom_conn/utilities/auth_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(context) * 0.005),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.03,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(context) * 0.005),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.03,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(context) * 0.005),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Support',
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.03,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(context) * 0.005),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'FAQs',
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.03,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(context) * 0.005),
            child: TextButton(
              onPressed: () {
                signOut();
                //Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.03,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.06,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.040,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              title: Text(
                'About Us',
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.040,
                  color: Colors.black,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Disclaimer',
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.040,
                  color: Colors.black,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: getScreenHeight(context) * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ust_main_building.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: getScreenHeight(context) * 0.020),
          Expanded(
            child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: getScreenHeight(context) * 0.041,
                crossAxisSpacing: getScreenWidth(context) * 0.010,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            MdiIcons.townHall,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'General Info',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            LineAwesomeIcons.chalkboard_teacher,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'Faculty and Staff',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            MdiIcons.accountSchoolOutline,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'Alumni',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            Ionicons.search_outline,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'Researches',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            Ionicons.newspaper_outline,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'News/Events',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            CupertinoIcons.shopping_cart,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'Shop',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            LineAwesomeIcons.heartbeat,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'Hospital Services',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            Ionicons.briefcase_outline,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'Career',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            Ionicons.book_outline,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'Library',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            CupertinoIcons.group,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'Organizations',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            Ionicons.fast_food_outline,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'Food',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            Ionicons.map_outline,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'Campus Map',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          Container(
            color: Colors.black,
            height: getScreenHeight(context) * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Copyright © 2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getScreenWidth(context) * 0.037,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
