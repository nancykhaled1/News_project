import 'package:flutter/material.dart';
import 'package:news_project/news/news_container_viewModel.dart';
import 'package:news_project/news/news_item.dart';
import 'package:provider/provider.dart';

import '../MyTheme.dart';
import '../model/SourceResponse.dart';

class NewsContainer extends StatefulWidget {
  Source source;

  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsContainerViewModel viewModel = NewsContainerViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsContainerViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text('SomeThing Went Wrong'),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBySourceId(widget.source.id ?? '');
                  },
                  child: Text('Try Again'),
                ),
              ],
            );
          } else if (viewModel.newsList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.primaryColor,
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: viewModel.newsList![index]);
              },
              itemCount: viewModel.newsList?.length,
            );
          }
        },
      ),
    ));
  }
}
