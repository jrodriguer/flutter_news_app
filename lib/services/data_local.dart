import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataLocal {
  Logger logger = Logger(printer: PrettyPrinter());
  List<Article> articles = <Article>[];
  bool databaseCreated = false;

  Future<SharedPreferences> createDatabase() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    databaseCreated = true;
    return prefs;
  }

  Future<void> saveNew(Article evNew) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString('favorites');
    List<Article> favorites = [];

    if (favoritesJson != null) {
      final List<dynamic> favoritesData = json.decode(favoritesJson);
      favorites = favoritesData.map((item) => Article.fromJson(item)).toList();
    }

    // Using firstWhere method if no element satisfies the condition, it throws a StateError
    final exists =
        favorites.firstWhereOrNull((fav) => fav.title == evNew.title);

    if (exists == null) {
      favorites.insert(0, evNew);
      final favoritesData = favorites.map((item) => item.toJson()).toList();
      prefs.setString('favorites', json.encode(favoritesData));
    }
  }

  Future<void> loadFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString('favorites');

    if (favoritesJson != null) {
      final List<dynamic> favoritesData = json.decode(favoritesJson);
      articles = favoritesData.map((item) => Article.fromJson(item)).toList();
    }
  }

  Future<void> deleteNew(Article evNew) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    articles.removeWhere((article) => article.title == evNew.title);
    final favoritesData = articles.map((item) => item.toJson()).toList();
    prefs.setString('favorites', json.encode(favoritesData));
  }
}
