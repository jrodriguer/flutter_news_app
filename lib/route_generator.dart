import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/favorites.dart';
import 'package:flutter_news_app/screens/headers.dart';
import 'package:flutter_news_app/screens/personal.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/personal':
        return MaterialPageRoute(
          builder: (_) => const PersonalScreen(),
        );
      case '/headers':
        return MaterialPageRoute(
          builder: (_) => const HeadersScreeen(),
        );
      case '/favorites':
        return MaterialPageRoute(
          builder: (_) => const FavoritesScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('This page does not exist'),
        ),
      );
    });
  }
}
