
import 'package:flutter/material.dart';
import 'package:news_feed/view/screens/pages/news_list_page.dart';
import 'package:news_feed/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {


  runApp(
    ChangeNotifierProvider<NewsListViewModel>(

        create: (context) =>NewsListViewModel(),
        child:MyApp(),

    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsListPage(),
    );
  }
}
