import 'package:flutter/material.dart';
import 'package:news_project/category/categeory_details.dart';
import 'package:news_project/category/category_fragments.dart';
import 'package:news_project/model/category_data.dart';
import 'package:news_project/settings_screen.dart';

import 'home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routeNam = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: Colors.white,
            child: Image(image: AssetImage('assets/images/settings.png'),
            height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
          drawer: Drawer(
           child: HomeDrawer(onDrawerClick: onDrawerClick ,)
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedDrawer == HomeDrawer.settings ?
              'Settings' :
                  selectedCategory == null ?
              'News App' :
              selectedCategory!.title!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: selectedDrawer == HomeDrawer.settings ?
              SettingsTab() :
          selectedCategory == null ?
          CategoryFragments(onCategoryClick: onCategoryClick ,) :
          CategeoryDetails(category: selectedCategory!),

        )
      ],
    );
  }

  CategorData? selectedCategory;

  void onCategoryClick(CategorData newSelectedCategory){
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }

  int selectedDrawer = HomeDrawer.categories;
  void onDrawerClick(int newSelectedDrawer){
    selectedDrawer = newSelectedDrawer;
    Navigator.of(context).pop();
    selectedCategory = null;
    setState(() {

    });

  }
}
