import 'package:flutter/cupertino.dart';
import 'package:news_project/apis/api_manager.dart';
import 'package:news_project/model/NewsResponse.dart';

class NewsContainerViewModel extends ChangeNotifier {
  List<News>? newsList;
  String? errorMessage;

  void getNewsBySourceId(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourcesId(sourceId);
      if (response?.status == 'error') {
        errorMessage = response?.message;
      } else {
        newsList = response?.articles;
      }
    } catch (e) {
      errorMessage = 'Error Loading News List';
    }
    notifyListeners();
  }
}
