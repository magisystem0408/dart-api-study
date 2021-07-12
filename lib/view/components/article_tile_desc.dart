import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';

class ArticleTileDesc extends StatelessWidget {
  final Article article;
  const ArticleTileDesc({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme =Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(article.title ?? "",style: textTheme.subtitle2?.copyWith(
          fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 2.0),
        Text(article.publishDate ?? "",style: textTheme.overline?.copyWith(fontStyle: FontStyle.italic)),
        Text(article.description ?? "",style: textTheme.bodyText2?.copyWith()),
      ],
    );
  }
}
