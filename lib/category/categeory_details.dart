import 'package:flutter/material.dart';
import 'package:news_project/MyTheme.dart';
import 'package:news_project/apis/api_manager.dart';
import 'package:news_project/category/category_details_viewModel.dart';
import 'package:news_project/category/tab_container.dart';
import 'package:news_project/model/SourceResponse.dart';
import 'package:provider/provider.dart';

import '../model/category_data.dart';

class CategeoryDetails extends StatefulWidget {
  static const routeNam = 'category';
  CategorData category;

  CategeoryDetails({required this.category});

  @override
  State<CategeoryDetails> createState() => _CategeoryDetailsState();
}

class _CategeoryDetailsState extends State<CategeoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.category.id != null) {
      viewModel.getSources(widget.category.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
          builder: (context, viewModel, child) {
        if (viewModel.errorMessage != null) {
          return Column(children: [
            Text('SomeThing Went Wrong'),
            ElevatedButton(
              onPressed: () {
                if (widget.category.id != null) {
                  viewModel.getSources(widget.category.id!);
                  setState(() {});
                }
              },
              child: Text('Try Again'),
            ),
          ]);
        } else if (viewModel.sourcesList == null) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primaryColor,
            ),
          );
        } else {
          return TabContainer(
            sourcesList: viewModel.sourcesList!,
          );
        }
      }),
    );

    FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(widget.category.id),
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
                onPressed: () {
                  ApiManager.getSources(widget.category.id);
                  setState(() {});
                },
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
        var sourcesList = snapshot.data?.sources ?? [];
        return TabContainer(
          sourcesList: sourcesList,
        );
      },
    );
  }
}
