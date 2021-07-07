import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/serch_type.dart';
import 'package:news_feed/view/components/category_chips.dart';
import 'package:news_feed/view/components/serch.dart';
import 'package:news_feed/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            tooltip: "更新",
            onPressed: () => onRefresh,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                //todo 検索ワード
                Serch(
                  onSearch: (keyword) => getKeywordNews(context, keyword),
                ),
                //todo カテゴリー選択
                CategoryChips(
                  onCategorySelected: (category) =>
                      getCategoryNews(context, category),
                ),

                //todo 記事表示
                // Expanded(child: Center(child: CircularProgressIndicator())),
              ],
            ),
          ),
        ));
  }

//todo　記事更新処理
  onRefresh(BuildContext context) {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    viewModel.getNews(
        serchType: viewModel.serchType,
        keyword: viewModel.keyword,
        category: viewModel.category);
  }

//todo　キーワード記事取得処理
  getKeywordNews(BuildContext context, keyword) {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    viewModel.getNews(
        serchType: SerchType.KEYWORD,
        keyword: keyword,
        category: categories[0]);
    // print("読み出された");
  }

  getCategoryNews(BuildContext context, category) {
    print("${category.nameJp}");

    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    viewModel.getNews(
      serchType: SerchType.CATEGORY,
      category: category,
    );
  }
}
