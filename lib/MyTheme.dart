import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryColor = Color(0xFF39A552);
  static Color blackColor = Color(0xFF303030);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color greyColor = Color(0xFF79828B);
  static Color redColor = Color(0xFFC91C22);
  static Color blueColor = Color(0xFF4882CF);
  static Color pinkColor = Color(0xFFED1E79);
  static Color yellowColor = Color(0xFFF2D352);
  static Color orangeColor = Color(0xFFCF7E48);
  static Color darkBlueColor = Color(0xFF003E90);




  static ThemeData LightMode = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      )
    ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: whiteColor,
          ),
          titleMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: blackColor,
          ),
          titleSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: blackColor,
          )));

}