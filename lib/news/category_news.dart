import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../MyTheme.dart';
import '../model/NewsResponse.dart';

class CategoryNews extends StatelessWidget {
  static const routeNam = 'cat_news';

  int index =0;

  // CategorData category;
  @override
  Widget build(BuildContext context) {
    News categorData = ModalRoute.of(context)!.settings.arguments as News;

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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'News App',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        body:
        Container(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: categorData.urlToImage ?? '',
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 10,),
                Text(categorData.author ?? '',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: MyTheme.greyColor
                  ),
                ),
                SizedBox(height: 10,),
                Text(categorData.title ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 10,),
                Text(categorData.publishedAt ?? '',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: MyTheme.greyColor
                  ),),

                SizedBox(
                  height: 30,
                ),

                Container(
                  color: MyTheme.whiteColor,
                  child: Column(
                    children: [
                      Text(categorData.content ?? '',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w400
                          )
                      ),
                         SizedBox(
                           height: 20,
                         ),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             InkWell(
                               onTap: (){
                                 launchURL(categorData.url ?? '');
                               },
                               child: Text('View Full Article',
                                style: TextStyle(
                                  fontSize: 18,

                                ),
                        ),
                             ),
                             Icon(Icons.arrow_right),
                           ],
                         ),

                    ],
                  ),
                ),

              ],
            ),
        ),

        ),]
    );
  }

  /*
  final Uri _url = Uri.parse('https://flutter.dev');

   */
  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);


      if (!await launchUrl(uri)) {
        throw Exception('Could not launch $uri');
      }

  }
}
