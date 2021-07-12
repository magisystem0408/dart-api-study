import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/serch_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/view/components/article_tile.dart';
import 'package:news_feed/view/components/category_chips.dart';
import 'package:news_feed/view/components/serch.dart';
import 'package:news_feed/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);

    print(viewModel.isLoading);

    // もしローディングしていなかったら呼び出す
    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getNews(
          serchType: SerchType.CATEGORY, category: categories[0]));
    }

    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        tooltip: "更新",
        onPressed: () => onRefresh(context),
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
            Expanded(
                child: Consumer<NewsListViewModel>(
                    builder: (context,model,child){
                      return model.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                          itemCount: model.articles.length,
                          itemBuilder: (context,int position)=>ArticleTile(
                            article: model.articles[position],
                            onArticleClicked: (article)=>_openArticleWebPage(article,context),
                          ));
                    },)),
          ],
        ),
      ),
    ));
  }

//todo　記事更新処理
  Future<void> onRefresh(BuildContext context) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
        serchType: viewModel.serchType,
        keyword: viewModel.keyword,
        category: viewModel.category);
  }

//todo　キーワード記事取得処理
  Future<void> getKeywordNews(BuildContext context, keyword) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
        serchType: SerchType.KEYWORD,
        keyword: keyword,
        category: categories[0]);
    // print("読み出された");
  }
// todo カテゴリー記事取得処理
  Future<void> getCategoryNews(BuildContext context, category) async {
    print("${category.nameJp}");

    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      serchType: SerchType.CATEGORY,
      category: category,
    );
  }

// todo webビュー
  _openArticleWebPage(article, BuildContext context) {


  }
}
