import 'dart:convert';

import 'package:flutter_news_app/model/article_model.dart';

TopHeadlines topHeadlinesFromJson(String str) =>
    TopHeadlines.fromJson(json.decode(str));

String topHeadlinesToJson(TopHeadlines data) => json.encode(data.toJson());

class TopHeadlines {
  String status;
  int totalResults;
  List<Article> articles;

  TopHeadlines({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory TopHeadlines.fromJson(Map<String, dynamic> json) => TopHeadlines(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}
