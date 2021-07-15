import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/data/serch_type.dart';
import 'package:news_feed/view/components/serch.dart';
import 'package:news_feed/viewmodels/head_line_viewmodel.dart';
import 'package:provider/provider.dart';

class HeadLinePage extends StatelessWidget {
  const HeadLinePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

  final viewModel =Provider.of<HeadLineViewModel>(context,listen:false);
    if(!viewModel.isLoading && viewModel.articles.isEmpty){
      Future(()=> viewModel.getHeadLines(SerchType.HEAD_LINE

      ));

    }

    return SafeArea(child: Scaffold(
      body: Container(
        child: Center(child: Text("Headline"),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>onRefresh(context),
        child: Icon(Icons.refresh),
      ),

    ));
  }
  //todo 更新処理
  onRefresh(BuildContext context) async{
    final viewModel =Provider.of<HeadLineViewModel>(context,listen: false);
    await viewModel.getHeadLines(SerchType.HEAD_LINE);

  }
}
