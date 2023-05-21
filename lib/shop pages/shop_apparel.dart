import 'package:flutter/material.dart';
import 'package:tom_conn/shop%20pages/shop_details.dart';
import '../utilities/getWH.dart';

class ShopApparel extends StatelessWidget {
  const ShopApparel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: [
          SizedBox(height: getScreenHeight(context) * 0.03),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: getScreenWidth(context) - 30,
            height: getScreenHeight(context) - 50,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                buildcard(
                    'UST Museum Curio Shop',
                    'assets/images/ust_curio.jpg',
                    'https://www.facebook.com/USTMuseumCurioShop/shop/?ref_code=mini_shop_profile_plus_shop_tab_cta&ref_surface=profile',
                    'UST Museum UST Main Building',
                    'The UST Museum Curio Shop was established in 1998, offering a variety of souvenir items featuring t-shirts, id laces, and many more.',
                    context),
                buildcard(
                  'U-Store',
                  'assets/images/ustore.png',
                  '',
                  'Lobby of the Quadricentennial Pavilion',
                  'U-Store is a souvenir store which offers a variety of products such t-shirts, stuffed toys, jerseys, etc.',
                  context,
                ),
                buildcard(
                  'Tiger Apparel',
                  'assets/images/tiger_apperel.jpg',
                  'https://www.facebook.com/TigerApparel2019/',
                  'No physical Store',
                  'Tiger Apparel is a startup company and now is one of the leading UST apparel brand in the metro.',
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildcard(String shopName, String imgPath, String shopUrl,
      String location, String description, context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Details(
                assetPath: imgPath,
                name: shopName,
                sUrl: shopUrl,
                loc: location,
                desc: description,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(height: getScreenHeight(context) * 0.025),
              Hero(
                tag: imgPath,
                child: Container(
                  height: getScreenHeight(context) * 0.1,
                  width: getScreenWidth(context) * 0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          imgPath,
                        ),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              SizedBox(height: getScreenHeight(context) * 0.03),
              Text(
                shopName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.04,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
