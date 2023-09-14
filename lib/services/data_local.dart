import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logging/logging.dart';

class DataLocal {
  static final Logger _log = Logger('Datalocal');
  List<Article> articles = <Article>[];
  bool databaseCreated = false;

  Future<void> saveNew(Article evNew) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString('favorites');

    List<Article> favorites = [];

    if (favoritesJson != null) {
      _log.info('Does exist as a favorite');

      final List<dynamic> favoritesData = json.decode(favoritesJson);

      favorites = favoritesData.map((item) => Article.fromJson(item)).toList();
    }

    // Using firstWhere method if no element satisfies the condition, it throws a StateError
    final exists =
        favorites.firstWhereOrNull((fav) => fav.title == evNew.title);

    if (exists == null) {
      _log.info('Does not exist as a favorite');

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

      _log.info('List of favorites loaded');
    }
  }

  Future<void> deleteNew(Article evNew) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _log.info('Removing the article of favorites');

    articles.removeWhere((article) => article.title == evNew.title);

    final favoritesData = articles.map((item) => item.toJson()).toList();
    prefs.setString('favorites', json.encode(favoritesData));
  }
}
