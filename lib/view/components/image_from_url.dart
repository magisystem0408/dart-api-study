import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageFromUrl extends StatelessWidget {
  final String? imageUrl;

  const ImageFromUrl({Key? key, this.imageUrl}) : super(key: key);

  // final primaryColor =Theme.of(context).primaryColor;

  @override
  Widget build(BuildContext context) {
    final isInvalidUrl =
        (imageUrl != null) ? imageUrl!.startsWith("http") : false;

    // しっかりとした画像なのか判定処理
    if (imageUrl == null || imageUrl == "" || !isInvalidUrl) {
     return const Icon(Icons.broken_image);
    }else{
      return CachedNetworkImage(
          imageUrl: imageUrl!,
           // ダウンロード中はplaceholderが走る
          placeholder: (context,url)=>Center(child: CircularProgressIndicator()),
          errorWidget: (context,url,error) =>const Icon(Icons.broken_image),
          fit: BoxFit.cover,
      );
    }
  }
}
