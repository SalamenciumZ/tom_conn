import 'package:flutter/material.dart';
import 'package:tom_conn/first_time_use.dart';
import 'package:tom_conn/login.dart';
import 'package:tom_conn/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Header Example',
      home: Scaffold(
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Support',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'FAQs',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 16,
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
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
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
      ),
    );
  }
}
