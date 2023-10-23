import 'package:flutter/material.dart';
import 'package:news_project/MyTheme.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;


  Function onDrawerClick;

 HomeDrawer({required this.onDrawerClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.13),
          width: double.infinity,
          child: Text('News App!',
          style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: (){
            onDrawerClick(HomeDrawer.categories);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(
                  width: 8,
                ),
                Text('Caregories',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: MyTheme.blackColor
                ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: (){
            onDrawerClick(HomeDrawer.settings);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 8,
                ),
                Text('Settings',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: MyTheme.blackColor
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
