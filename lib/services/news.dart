import 'dart:async';

import 'package:flutter_news_app/models/topheadlines.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class News {
  static final Logger _log = Logger('News');
  static const String _apiKey = '978764b3fe6b412f8517a7d9c0a1e140';
  static const String _baseUrl = 'https://newsapi.org/v2';
  int _headLinesPage = 0;
  String _categoryAct = '';
  int _categoryPg = 0;

  Future<TopHeadlines> _startQuery(String query) async {
    final url = '$_baseUrl$query&apiKey=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      _log.info('Good load of main headlines');
      return topHeadlinesFromJson(response.body);
    } else {
      _log.severe('The main headline data could not be loaded');
      throw Exception('The main headline data could not be loaded');
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
