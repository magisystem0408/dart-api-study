import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/serch_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/repository/new_repository.dart';

class NewsListViewModel extends ChangeNotifier {
  NewsRepository _repository =NewsRepository();
  // ゲッターで外から値のみを取得
  SerchType _serchType = SerchType.CATEGORY;
  SerchType get serchType => _serchType;

  Category _category = categories[0];
  Category get category => _category;

  String _keyword = "";

  String get keyword => _keyword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article> _articles =[];
  List<Article> get articles =>_articles;


  getNews({required SerchType serchType, String? keyword, Category? category})async {
    _serchType = serchType;
    _keyword = keyword ?? "";
    _category = category ?? categories[0];
    _isLoading = true;
    notifyListeners();
    _articles =await _repository.getNews(serchType: _serchType, keyword: _keyword, category: _category);

    _isLoading =false;
    notifyListeners();

    print("検索タイプ:$serchType/ キーワード: $keyword/カテゴリー:${category!.nameJp}");
  }
}
