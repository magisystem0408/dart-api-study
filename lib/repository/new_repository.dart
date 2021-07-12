import 'dart:convert';

import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/serch_type.dart';

import 'package:http/http.dart' as http;
import 'package:news_feed/models/model/news_model.dart';

class NewsRepository{


  static const BASE_URL ="https://newsapi.org/v2/top-headlines?country=jp";
  static const API_KEY ="9694ac6295eb4f06beeeffd2770cfc79";

  Future<List<Article>> getNews({required SerchType serchType,String? keyword,Category? category}) async{
    print("--------------------------------検索開始---------------------------------");
    List<Article> results =[];
    http.Response? response;

    switch (serchType){
      case SerchType.HEAD_LINE:
        final requestUrl =Uri.parse(BASE_URL+"&apiKey=$API_KEY");
        response =await http.get(requestUrl);
        break;

      case SerchType.KEYWORD:
        final requestUrl =Uri.parse(BASE_URL+"&q=$keyword&pageSize=30&apiKey=$API_KEY");
        response =await http.get(requestUrl);
        break;

      case SerchType.CATEGORY:
        final requestUrl =Uri.parse(BASE_URL+"&category=${category?.nameEn}&apiKey=$API_KEY");
        response =await http.get(requestUrl);

        break;
    }

    if(response.statusCode==200){
      final responseBody =response.body;
      // print(jsonDecode(responseBody));
      results =News.fromJson(jsonDecode(responseBody)).articles;
    }else{
      throw Exception('失敗した');
    }
    return results;
  }
}
