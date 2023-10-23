import 'package:flutter/material.dart';

class SearchNews extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
   IconButton(onPressed: (){
     query = '';
   },
     icon: Icon(Icons.close),
   )
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    },
        icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search User'),

    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search User'),

    );
  }

}