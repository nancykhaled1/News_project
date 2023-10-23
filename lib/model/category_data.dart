import 'dart:ui';
import 'package:news_project/MyTheme.dart';

class CategorData{
  String? id;
  String? title;
  Color? color;
  String? imageUrl;

  CategorData({required this.title,
  required this.id , required this.color, required this.imageUrl});
/*
business entertainment general health science sports technology.
 */

  static List<CategorData> getCategories(){
    return [
      CategorData(title: 'sports', id: 'sports', color: MyTheme.redColor, imageUrl: 'assets/images/sports.png'),
      CategorData(title: 'business', id: 'business', color: MyTheme.orangeColor, imageUrl: 'assets/images/bussines.png'),
      CategorData(title: 'entertainment', id: 'entertainment', color: MyTheme.greyColor, imageUrl: 'assets/images/environment.png'),
      CategorData(title: 'general', id: 'general', color: MyTheme.darkBlueColor, imageUrl: 'assets/images/politics.png'),
      CategorData(title: 'health', id: 'health', color: MyTheme.pinkColor, imageUrl: 'assets/images/health.png'),
      CategorData(title: 'science', id: 'science', color: MyTheme.yellowColor, imageUrl: 'assets/images/science.png'),
      CategorData(title: 'technology', id: 'technology', color: MyTheme.blueColor, imageUrl: 'assets/images/bussines.png'),
    ];
  }
}