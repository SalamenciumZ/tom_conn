import 'package:flutter/material.dart';

//GET SCREEN HEIGHT AND WIDTH
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double widthOfScreen(BuildContext context, double width) {
  return MediaQuery.of(context).size.width * width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double heightOfScreen(BuildContext context, double height) {
  return MediaQuery.of(context).size.height * height;
}
