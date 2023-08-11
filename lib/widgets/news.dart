import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article.dart';

class News extends StatelessWidget {
  final List<Article> news;
  final bool onFavorites;

  const News({
    super.key,
    required this.news,
    this.onFavorites = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: news.length,
      // itemBuilder: (context, index) {
      //   return AppNew(
      //     new: news[index],
      //     onFavorites: onFavorites,
      //     index: index,
      //   );
      // },
      padding: const EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {},
    );
  }
}
