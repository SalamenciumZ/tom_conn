import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> itemTitles = [    'Starbucks',    'Jollibee',    'Pancake House',    'Ramen 99',    'Tokyo Tokyo',    'McDonald\'s',    'KFC',    'Chowking',    'Yellow Cab',    'Mang Inasal',  ];
  final List<String> itemImages = [    'assets/starbucks.png',    'assets/jollibee.png',    'assets/pancake-house.png',    'assets/ramen-99.png',    'assets/tokyo-tokyo.png',    'assets/mcdonalds.png',    'assets/kfc.png',    'assets/chowking.png',    'assets/yellow-cab.png',
    'assets/images/tomasino_connect_logo.png',  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView with Images',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('University of Santo Tomas Restaurants',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
          itemCount: itemTitles.length,
          itemBuilder: (BuildContext context, int index) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                onTap: () {
                  print('Item $index clicked');
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
                            image: AssetImage(itemImages[9]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          initialValue: itemTitles[index],
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Title',
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
