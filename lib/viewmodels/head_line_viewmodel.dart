import 'package:flutter/cupertino.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/serch_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/repository/new_repository.dart';

class HeadLineViewModel extends ChangeNotifier{
  final NewsRepository _repository =NewsRepository();

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


  Future<void> getHeadLines(SerchType head_line) async {
    _serchType =serchType;
    _isLoading =true;
    notifyListeners();

    _articles =await _repository.getNews(serchType: SerchType.HEAD_LINE);

    _isLoading=false;
    notifyListeners();



  }
}