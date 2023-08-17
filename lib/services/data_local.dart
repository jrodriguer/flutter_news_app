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

  Future<void> createDatabase() async {}

  Future<void> saveNew(Article evNew) async {}

  Future<void> loadFavorites() async {}

  Future<void> deleteNew() async {}
}
