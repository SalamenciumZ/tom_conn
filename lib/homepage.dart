import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Color iconColor = Colors.white;
  Color textColor = Colors.white;
  Color textColor1 = Colors.white;
  Color textColor2= Colors.white;
  Color textColor3 = Colors.white;
  Color textColor4 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: MouseRegion(
          onHover: (PointerEvent details) {
            setState(() {
              iconColor = Colors.yellow; // Change the color of the icon when it is hovered
            });
          },
          onExit: (PointerEvent details) {
            setState(() {
              iconColor = Colors.white; // Reset the color of the icon when the hover ends
            });
          },
          child: InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: iconColor,
            ),
          ),
        ),
        actions: [
          MouseRegion(
            onHover: (PointerEvent details) {
              setState(() {
                textColor = Colors.yellow; // Change the text color when the mouse is hovering over the button
              });
            },
            onExit: (PointerEvent details) {
              setState(() {
                textColor = Colors.white; // Reset the text color when the mouse leaves the button
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
          MouseRegion(
            onHover: (PointerEvent details){
              setState(() {
                textColor1 = Colors.yellow;
              });
            },
            onExit: (PointerEvent details){
              setState(() {
                textColor1 = Colors.white;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor1,
                  ),
                ),
              ),
            ),
          ),
          MouseRegion(
            onHover: (PointerEvent details){
              setState(() {
                textColor2 = Colors.yellow;
              });
            },
            onExit: (PointerEvent details){
              setState(() {
                textColor2 = Colors.white;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Support',
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor2,
                  ),
                ),
              ),
            ),
          ),
          MouseRegion(
            onHover: (PointerEvent details){
              setState(() {
                textColor3 =  Colors.yellow;
              });
            },
            onExit: (PointerEvent details){
              setState(() {
                textColor3 = Colors.white;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'FAQs',
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor3,
                  ),
                ),
              ),
            ),
          ),
          MouseRegion(
            onHover: (PointerEvent details){
              setState(() {
                textColor4 = Colors.yellow;
              });
            },
            onExit: (PointerEvent details){
              setState(() {
                textColor4 = Colors.white;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor4,
                  ),
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
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 3'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ust_main_building.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(crossAxisCount: 4, children: <Widget>[
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        MdiIcons.townHall,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        'General Info',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LineAwesomeIcons.chalkboard_teacher,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        'Faculty and Staff',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        MdiIcons.accountSchoolOutline,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        'Alumni',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Ionicons.search_outline,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        'Research Projects',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Ionicons.newspaper_outline,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        'News/Events',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.shopping_cart,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        'Shop',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LineAwesomeIcons.heartbeat,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        'Hospital Services',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Ionicons.briefcase_outline,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        'Career Opportunities',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Ionicons.book_outline,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        'Library',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.group,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        'Organizations',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Ionicons.fast_food_outline,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        'Food',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Ionicons.map_outline,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        'Campus Map',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Container(
            color: Colors.black,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Copyright © 2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
