import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_project/model/NewsResponse.dart';

import '../MyTheme.dart';
import 'category_news.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(CategoryNews.routeNam,arguments: news);
      },
      child: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 10,),
            Text(news.author ?? '',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: MyTheme.greyColor
            ),
            ),
            SizedBox(height: 10,),
            Text(news.title ?? '',
            style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10,),
            Text(news.publishedAt ?? '',
            textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: MyTheme.greyColor
              ),),
          ],
        ),
      ),
    );
  }
}
