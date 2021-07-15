
import 'package:flutter/material.dart';
import 'package:news_feed/view/screens/home_screen.dart';
import 'package:news_feed/view/screens/pages/news_list_page.dart';
import 'package:news_feed/viewmodels/head_line_viewmodel.dart';
import 'package:news_feed/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {


  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NewsListViewModel(),),
    ChangeNotifierProvider(create: (_)=> HeadLineViewModel())
  ],
  child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,

            fontFamily: "Bold"
      ),
      home: HomeScreen(),
    );
  }
}
