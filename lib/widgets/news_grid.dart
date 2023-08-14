import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:flutter_news_app/widgets/new_card.dart';

class NewsGrid extends StatelessWidget {
  final List<Article> news;
  final bool onFavorites;

  const NewsGrid({
    super.key,
    required this.news,
    this.onFavorites = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      itemCount: news.length,
      itemBuilder: (context, index) {
        return NewCard(
          article: news[index],
          onFavorites: onFavorites,
          index: index,
        );
      },
      padding: const EdgeInsets.all(10),
    );
  }
}
