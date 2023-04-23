import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class NavText extends StatefulWidget {
  final String text;

  NavText(this.text);

  @override
  _NavTextState createState() => _NavTextState();
}

class _NavTextState extends State<NavText> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _hovered = true),
      onExit: (event) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => print(widget.text),
        child: Text(
          widget.text,
          style: TextStyle(
            color: _hovered ? Colors.yellow : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }}

class MyApp extends StatelessWidget {
  final List<String> itemTitles = [    '7-Eleven', 'Lawson',  ];
  final List<String> itemImages = [    'assets/images/SevenEleven.png',    'assets/images/lawson.png',  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView with Images',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            'University of Santo Tomas Restaurants',
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
                            image: AssetImage(itemImages[index]),
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
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavText('Convenient store'),
              NavText('Fast Food'),
              NavText('Coffee Shop'),
            ],
          ),
        ),
      ),
    );
  }
}

