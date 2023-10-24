import 'package:flutter/cupertino.dart';
import 'package:news_project/apis/api_manager.dart';
import 'package:news_project/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<Source>? sourcesList;
  String? errorMessage;

  void getSources(String caregoryId) async {
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(caregoryId);
      if (response?.status == 'error') {
        errorMessage = response?.message;
      } else {
        sourcesList = response?.sources;
      }
    } catch (e) {
      errorMessage = 'Error Loading Sources List';
    }
    notifyListeners();
  }
}
