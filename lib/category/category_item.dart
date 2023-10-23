import 'package:flutter/material.dart';
import 'package:news_project/MyTheme.dart';
import '../model/category_data.dart';
import '../model/category_data.dart';


class CategoryItem extends StatelessWidget {
  CategorData category;

 int index;
 CategoryItem({required this.category, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(index%2 == 0 ? 20 : 0),
          bottomLeft: Radius.circular(index%2 == 0 ? 0 : 20) ,
        )
      ),
      child: Column(
        children: [
          Image.asset(category.imageUrl ?? '',
          height: MediaQuery.of(context).size.height * 0.13,
          ),
          SizedBox(
            height: 10,
          ),
          Text(category.title ?? '',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: MyTheme.whiteColor
          ),
          ),

        ],
      ),
    );
  }
}
