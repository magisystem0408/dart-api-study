import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//検索バーのコンポーネント

class Serch extends StatelessWidget {

  final ValueChanged onSearch;
  final TextEditingController _textEditingController =TextEditingController();

  Serch({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(24.0))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          onSubmitted: onSearch,
          maxLines: 1,
          controller: _textEditingController,
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: "検索ワードを入れてください",
              border: InputBorder.none
          ),
        ),
      ),
    );
  }
}
