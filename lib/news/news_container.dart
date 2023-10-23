import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_project/model/NewsResponse.dart';
import 'package:news_project/news/news_item.dart';
import 'package:news_project/news/search.dart';
import '../MyTheme.dart';
import '../apis/api_manager.dart';
import '../model/SourceResponse.dart';

class NewsContainer extends StatefulWidget {
  Source source;
  final News? news;
  NewsContainer({required this.source, this.news});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  List newsList = [];

  static const _pageSize = 20;

  final PagingController _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await ApiManager.getNewsBySourcesId(widget.source.id ?? '');
      final isLastPage = newItems?.articles!.length ?? 0 < _pageSize;

      if (isLastPage == true) {
        _pagingController.appendLastPage(newsList);
      } else {
        final nextPageKey = pageKey++;
        _pagingController.appendPage(newsList, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ApiManager.getNewsBySourcesId(widget.source.id ?? ''),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: MyTheme.primaryColor,
                ),
              );
            } else if (snapshot.hasError) {
              print('snapshot has error');
              return Column(
                children: [
                  Text('SomeThing Went Wrong'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Try Again'),
                  ),
                ],
              );
            }
            if (snapshot.data?.status != 'ok') {
              print('status error');
              return Column(
                children: [
                  Text(snapshot.data!.message!),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Try Again'),
                  )
                ],
              );
            }
            print('status = ok');
            var newsList = snapshot.data?.articles ?? [];
            return PagedListView(
              itemExtent: 20.0,
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) =>
                    NewsItem(news: newsList[index]),

              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
