import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataLocal {
  Logger logger = Logger(printer: PrettyPrinter());
  List<Article> articles = <Article>[];
  bool databaseCreated = false;

  Future<void> presentToast(String message) async {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

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

    final exists = favorites.firstWhere((fav) => fav.title == evNew.title);

    if (exists.isNull) {
      favorites.insert(0, evNew);
      final favoritesData = favorites.map((item) => item.toJson()).toList();
      prefs.setString('favorites', json.encode(favoritesData));

      presentToast('Add to favorites');
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
    presentToast('Delete favorite article');
  }
}
