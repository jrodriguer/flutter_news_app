import 'package:flutter_news_app/models/topheadlines.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:logger/logger.dart';

class NewsService {
  Logger logger = Logger(printer: PrettyPrinter());
  static const String _apiKey = '978764b3fe6b412f8517a7d9c0a1e140';
  static const String _baseUrl = 'https://newsapi.org/v2';
  int _headLinesPage = 0;
  String _categoryAct = '';
  int _categoryPg = 0;

  Future<TopHeadlines> _startQuery(String query) async {
    final url = '$_baseUrl$query&apiKey=$_apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      logger.i('Good load data');
      return topHeadlinesFromJson(response.body);
    } else {
      logger.e('Failed to load data');
      throw Exception('Failed to load data');
    }
  }

  Future<TopHeadlines> getTopHeadLines() async {
    _headLinesPage++;
    return _startQuery('/top-headlines?country=us&page=$_headLinesPage');
  }

  Future<TopHeadlines> getTopHeadLinesCategory(String category) async {
    if (_categoryAct == category) {
      _categoryPg++;
    } else {
      _categoryPg = 1;
      _categoryAct = category;
    }
    return _startQuery(
        '/top-headlines?country=us&category=$category&page=$_categoryPg');
  }
}
