import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_project/MyTheme.dart';
import 'package:news_project/category/category_item.dart';
import 'package:news_project/model/category_data.dart';
class CategoryFragments extends StatelessWidget {
 var categoriesList = CategorData.getCategories();
 Function onCategoryClick ;
 CategoryFragments({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 25
            ),
            child: Text('Pick your category \nof interest',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: MyTheme.blackColor
            ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
                ),
              itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      onCategoryClick(categoriesList[index]);
                    },
                      child: CategoryItem(category: categoriesList[index], index: index));
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
