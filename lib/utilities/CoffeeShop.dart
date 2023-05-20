import 'package:flutter/material.dart';
import 'package:tom_conn/utilities/ConvStore.dart';
import 'package:tom_conn/utilities/FastFood.dart';
import 'package:url_launcher/url_launcher.dart';

class CoffeeShop extends StatelessWidget {
  final List<String> itemTitles = [
    'Starbucks',
    'Seattles Best'
  ];

  final List<String> itemImages = [
    'assets/images/starbsLogo.png',
    'assets/images/seattles.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set yellow background color
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white, // Set black text color
                textStyle: TextStyle(color: Colors.white), // Set white glow when hovered
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/convenientStores');
              },
              child: Text('Convenient Stores'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white, // Set black text color
                textStyle: TextStyle(color: Colors.white), // Set white glow when hovered
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/fastFood');
              },
              child: Text('Fast Food'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white, // Set black text color
                textStyle: TextStyle(color: Colors.white), // Set white glow when hovered
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/coffeeShop');
              },
              child: Text('Coffee Shop'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white, // Set black text color
                textStyle: TextStyle(color: Colors.white), // Set white glow when hovered
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('All'),
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: itemTitles.length,
          itemBuilder: (BuildContext context, int index) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                onTap: () {
                  String itemTitle = itemTitles[index];
                  String url = "";

                  if (itemTitle == 'Starbucks') {
                    url = 'https://www.starbucks.ph/';
                  } else if (itemTitle == 'Seattle\s Best') {
                    url = 'https://seattlesbest.com.ph/';
                  }

                  if (url.isNotEmpty) {
                    _launchURL(context, url);
                  }
                },
                child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300] ?? Colors.grey,
                        offset: Offset(0, 2),
                        blurRadius: 2,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                            image: AssetImage(itemImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          child: Text(
                            itemTitles[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),

      ),
    );
  }
}

void _launchURL(BuildContext context, String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}