import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article.dart';

class New extends StatelessWidget {
  final Article newArticle;
  final int index;
  final bool onFavorites;

  const New(
      {super.key,
      required this.newArticle,
      required this.index,
      this.onFavorites = false});

  @override
  Widget build(BuildContext context) {
    return Card();
  }
}
