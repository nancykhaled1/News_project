import 'package:flutter/material.dart';
import 'package:news_project/category/tab_item.dart';
import 'package:news_project/model/NewsResponse.dart';
import 'package:news_project/model/SourceResponse.dart';
import 'package:news_project/news/news_container.dart';

class TabContainer extends StatefulWidget{
  List<Source> sourcesList ;
  News? news;

  TabContainer({required this.sourcesList ,  this.news});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                selectedIndex = index;
                setState(() {

                });
              },
              isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sourcesList.map((source) => TabItem(
                  source: source,
                    isSelected: selectedIndex == widget.sourcesList.indexOf(source),
                )).toList(),
            ),
            Expanded(
                child: NewsContainer(source: widget.sourcesList[selectedIndex])),
          ],
        )
    );
  }
}