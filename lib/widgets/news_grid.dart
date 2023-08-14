import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:flutter_news_app/widgets/new_card.dart';

class NewsGrid extends StatelessWidget {
  final List<Article> news;

  const NewsGrid({
    super.key,
    required this.news,
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
        );
      },
      padding: const EdgeInsets.all(10),
    );
  }
}
