import 'package:flutter/material.dart';
import 'package:news_project/MyTheme.dart';

import '../model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;
  TabItem({required this.isSelected, required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10
      ),
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2
        ),
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent ,
      ),
      child: Text(source.name ?? '',
      style: TextStyle(
        fontSize: 18,
        color: isSelected ? MyTheme.whiteColor : Theme.of(context).primaryColor,
      ),
      ),
    );
  }
}
