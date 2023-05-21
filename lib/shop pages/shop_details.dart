import 'package:flutter/material.dart';
import 'package:tom_conn/utilities/auth_page.dart';
import 'package:tom_conn/utilities/getWH.dart';

import '../webView.dart';

class Details extends StatelessWidget {
  final assetPath, name, sUrl, loc, desc;

  Details({this.assetPath, this.name, this.sUrl, this.loc, this.desc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(254, 192, 15, 1),
        title: Text('SHOPS'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthPage()),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: getScreenHeight(context) * 0.015),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              name,
              style: TextStyle(
                fontSize: getScreenWidth(context) * 0.07,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(254, 192, 15, 1),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: getScreenHeight(context) * 0.015),
          Hero(
            tag: assetPath,
            child: Image.asset(
              assetPath,
              height: getScreenHeight(context) * 0.35,
              width: getScreenWidth(context) * 0.35,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: getScreenHeight(context) * 0.03),
          Padding(
            padding: EdgeInsets.only(
                left: getScreenWidth(context) * 0.05,
                right: getScreenWidth(context) * 0.05),
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getScreenWidth(context) * 0.04,
              ),
            ),
          ),
          SizedBox(height: getScreenHeight(context) * 0.025),
          Padding(
            padding: EdgeInsets.only(
                left: getScreenWidth(context) * 0.035,
                right: getScreenWidth(context) * 0.035),
            child: Text(
              'Location: ' + loc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getScreenWidth(context) * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: getScreenHeight(context) * 0.025),
          Center(
            child: GestureDetector(
              onTap: () {
                if (sUrl != "") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyWebView(url: sUrl)),
                  );
                } else {
                  {}
                }
              },
              child: Column(
                children: [
                  if (sUrl != '') ...[
                    Container(
                      width: getScreenWidth(context) - 50,
                      height: getScreenHeight(context) * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color.fromRGBO(254, 192, 15, 1),
                      ),
                      child: Center(
                        child: Text(
                          'More Info',
                          style: TextStyle(
                            fontSize: getScreenWidth(context) * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    Container(
                      width: getScreenWidth(context) - 50,
                      height: getScreenHeight(context) * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          'No Website',
                          style: TextStyle(
                            fontSize: getScreenWidth(context) * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
