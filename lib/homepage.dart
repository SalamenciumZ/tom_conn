import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tom_conn/WebView.dart';
import 'package:tom_conn/utilities/auth_page.dart';
import 'package:tom_conn/utilities/getWH.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tom_conn/settingsList.dart';

//comment
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  void signOut() {
    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthPage()),
    );
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
              },
              child: Row(
                children: [
                  if (user.isAnonymous) ...[
                    Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: getScreenWidth(context) * 0.03,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  if (!user.isAnonymous) ...[
                    Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: getScreenWidth(context) * 0.03,
                        color: Colors.white,
                      ),
                    )
                  ]
                ],
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
          SizedBox(height: getScreenHeight(context) * 0.017),
          Expanded(
            child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: getScreenHeight(context) * 0.041,
                crossAxisSpacing: getScreenWidth(context) * 0.010,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      if (user.isAnonymous) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyWebView(
                                  url:
                                      'https://www.ust.edu.ph/the-university/')),
                        );
                      } else {
                        if (user.email!.contains('teacher')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyWebView(
                                    url: 'https://guruspatio.ust.edu.ph/')),
                          );
                        } else if (user.email!.contains('alumni')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyWebView(
                                    url:
                                        'https://alumnirelations.ust.edu.ph/login')),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyWebView(
                                    url:
                                        'https://myuste.ust.edu.ph/student/index.jsp?id=gray')),
                          );
                        }
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (user.isAnonymous) ...[
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
                        ] else ...[
                          if (user.email!.contains('teacher')) ...[
                            CircleAvatar(
                              radius: getScreenWidth(context) * 0.07,
                              backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                              child: Icon(
                                LineAwesomeIcons.chalkboard,
                                color: Colors.white,
                                size: getScreenWidth(context) * 0.06,
                              ),
                            ),
                            SizedBox(height: getScreenHeight(context) * 0.010),
                            Text(
                              'Guru\u0027s Patio',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(context) * 0.03),
                            ),
                          ] else if (user.email!.contains('alumni')) ...[
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
                              'Alumni Portal',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(context) * 0.03),
                            ),
                          ] else ...[
                            CircleAvatar(
                              radius: getScreenWidth(context) * 0.07,
                              backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                              child: Icon(
                                LineAwesomeIcons.user,
                                color: Colors.white,
                                size: getScreenWidth(context) * 0.06,
                              ),
                            ),
                            SizedBox(height: getScreenHeight(context) * 0.010),
                            Text(
                              'MyUste Portal',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(context) * 0.03),
                            ),
                          ]
                        ]
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (user.isAnonymous) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyWebView(
                                  url:
                                      'https://www.ust.edu.ph/academics/programs/')),
                        );
                      } else {
                        if (user.email!.contains('teacher')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyWebView(
                                    url: 'https://guruspatio.ust.edu.ph/')),
                          );
                        } else if (user.email!.contains('alumni')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyWebView(
                                    url:
                                        'https://www.ust.edu.ph/administrative-offices/office-of-alumni-relations/')),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyWebView(
                                    url:
                                        'https://ust.blackboard.com/webapps/login/')),
                          );
                        }
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (user.isAnonymous) ...[
                          CircleAvatar(
                            radius: getScreenWidth(context) * 0.07,
                            backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                            child: Icon(
                              MdiIcons.bookEducationOutline,
                              color: Colors.white,
                              size: getScreenWidth(context) * 0.06,
                            ),
                          ),
                          SizedBox(height: getScreenHeight(context) * 0.010),
                          Text(
                            'Offered Programs',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getScreenWidth(context) * 0.03),
                          ),
                        ] else ...[
                          if (user.email!.contains('teacher')) ...[
                            CircleAvatar(
                              radius: getScreenWidth(context) * 0.07,
                              backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                              child: Icon(
                                LineAwesomeIcons.user_tie,
                                color: Colors.white,
                                size: getScreenWidth(context) * 0.06,
                              ),
                            ),
                            SizedBox(height: getScreenHeight(context) * 0.010),
                            Text(
                              'Staff Portal',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(context) * 0.03),
                            ),
                          ] else if (user.email!.contains('alumni')) ...[
                            CircleAvatar(
                              radius: getScreenWidth(context) * 0.07,
                              backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                              child: Icon(
                                LineAwesomeIcons.users,
                                color: Colors.white,
                                size: getScreenWidth(context) * 0.06,
                              ),
                            ),
                            SizedBox(height: getScreenHeight(context) * 0.010),
                            Text(
                              'Alumni Relations',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(context) * 0.03),
                            ),
                          ] else ...[
                            CircleAvatar(
                              radius: getScreenWidth(context) * 0.07,
                              backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                              child: Icon(
                                LineAwesomeIcons.alternate_cloud_upload,
                                color: Colors.white,
                                size: getScreenWidth(context) * 0.06,
                              ),
                            ),
                            SizedBox(height: getScreenHeight(context) * 0.010),
                            Text(
                              'Cloud Campus',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(context) * 0.03),
                            ),
                          ]
                        ]
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (user.isAnonymous) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyWebView(
                                  url: 'https://ofad.ust.edu.ph/')),
                        );
                      } else {
                        if (user.email!.contains('alumni')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyWebView(
                                    url:
                                        'https://www.ust.edu.ph/academics/faculties-colleges-institutes-and-schools/')),
                          );
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyWebView(
                                      url: 'https://thomedss.ust.edu.ph/')));
                        }
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (user.isAnonymous) ...[
                          CircleAvatar(
                            radius: getScreenWidth(context) * 0.07,
                            backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                            child: Icon(
                              LineAwesomeIcons.question,
                              color: Colors.white,
                              size: getScreenWidth(context) * 0.06,
                            ),
                          ),
                          SizedBox(height: getScreenHeight(context) * 0.010),
                          Text(
                            'OFAD',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getScreenWidth(context) * 0.03),
                          ),
                        ] else ...[
                          if (user.email!.contains('alumni')) ...[
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
                              'Faculties',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(context) * 0.03),
                            ),
                          ] else ...[
                            CircleAvatar(
                              radius: getScreenWidth(context) * 0.07,
                              backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                              child: Icon(
                                LineAwesomeIcons.medical_notes,
                                color: Colors.white,
                                size: getScreenWidth(context) * 0.06,
                              ),
                            ),
                            SizedBox(height: getScreenHeight(context) * 0.010),
                            Text(
                              'ThOMedSS',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getScreenWidth(context) * 0.03),
                            ),
                          ]
                        ]
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWebView(
                                url:
                                    'https://www.ust.edu.ph/category/upcoming-events/')),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getScreenWidth(context) * 0.07,
                          backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                          child: Icon(
                            Ionicons.calendar_outline,
                            color: Colors.white,
                            size: getScreenWidth(context) * 0.06,
                          ),
                        ),
                        SizedBox(height: getScreenHeight(context) * 0.010),
                        Text(
                          'Events',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWebView(
                                url:
                                    'https://www.ust.edu.ph/category/u-wide-news/')),
                      );
                    },
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
                          'News',
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
                          'Shops',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getScreenWidth(context) * 0.03),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWebView(
                                url: 'http://www.usthospital.com.ph/')),
                      );
                    },
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWebView(
                                url: 'https://careers-ust.prosple.com/')),
                      );
                    },
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWebView(
                                url: 'https://library.ust.edu.ph/')),
                      );
                    },
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWebView(
                                url:
                                    'https://www.ust.edu.ph/campus-life/recognized-student-organizations/')),
                      );
                    },
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
                    onTap: () {
                      Navigator.pushNamed(context, '/food');
                    },
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWebView(
                                url: 'https://www.ust.edu.ph//campus-map/')),
                      );
                    },
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
            height: getScreenHeight(context) * 0.08,
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
      bottomNavigationBar: GNav(
        selectedIndex: 0,
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
                signOut();
              },
              child: Text("Yes"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => super.widget));
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
