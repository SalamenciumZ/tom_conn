import 'package:flutter/material.dart';
import 'package:tom_conn/shop%20pages/shop_apparel.dart';
import 'package:tom_conn/shop%20pages/shop_other.dart';
import 'package:tom_conn/shop%20pages/shop_page.dart';
import 'package:tom_conn/utilities/auth_page.dart';
import 'package:tom_conn/utilities/getWH.dart';

class Shops extends StatefulWidget {
  const Shops({Key? key}) : super(key: key);

  @override
  _ShopsState createState() => _ShopsState();
}

class _ShopsState extends State<Shops> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
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
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: getScreenHeight(context) * 0.03),
          Container(
            alignment: Alignment.center,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color.fromRGBO(254, 192, 15, 1),
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  child: Text(
                    'All',
                    style: TextStyle(fontSize: getScreenWidth(context) * 0.04),
                  ),
                ),
                Tab(
                  child: Text(
                    'Apparel',
                    style: TextStyle(fontSize: getScreenWidth(context) * 0.04),
                  ),
                ),
                Tab(
                  child: Text(
                    'Others',
                    style: TextStyle(fontSize: getScreenWidth(context) * 0.04),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: getScreenHeight(context) - 50,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                ShopPage(),
                ShopApparel(),
                ShopOther(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
