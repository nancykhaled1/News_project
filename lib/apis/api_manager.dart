import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_project/apis/api_constants.dart';
import 'package:news_project/model/NewsResponse.dart';
import 'package:news_project/model/SourceResponse.dart';

class ApiManager{
  static Future<SourceResponse?> getSources(String? caregoryId)async {
    /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=cd23887c1516441189a70444566badb5
   */
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,
    {
      'apiKey' : 'cd23887c1516441189a70444566badb5',
      'category' : caregoryId
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    }catch(e){
      throw e;
    }


  }

  static Future<NewsResponse?> getNewsBySourcesId(String sourceId,  )async {
    /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=cd23887c1516441189a70444566badb5
   */
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,
        {
          'apiKey' : 'cd23887c1516441189a70444566badb5',
          'sources' : sourceId,
        //  'q' : query
        });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }


  }

  static Future<NewsResponse?> pagination(int page )async {
    /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=cd23887c1516441189a70444566badb5
   */
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,
        {
          'apiKey' : 'cd23887c1516441189a70444566badb5',
          'page' : page

        });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);

    }catch(e){
      throw e;
    }


  }


}