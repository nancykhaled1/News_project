import 'package:flutter/material.dart';
import 'package:news_project/MyTheme.dart';
import 'home_screen.dart';
import 'news/category_news.dart';


void main() async {
  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeNam,
      routes: {
        HomeScreen.routeNam: (context) => HomeScreen(),
        CategoryNews.routeNam: (context) => CategoryNews()
      ///  CategoryNews.routeNam: (context) => CategoryNews(),


      },
      theme: MyTheme.LightMode,
    );
  }
}