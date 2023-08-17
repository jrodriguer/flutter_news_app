import 'package:flutter/material.dart';
import 'package:flutter_news_app/helpers/helpers.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:flutter_news_app/models/topheadlines.dart';
import 'package:flutter_news_app/services/news.dart';
import 'package:flutter_news_app/widgets/news_grid.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logger/logger.dart';

class HeadersScreeen extends StatefulWidget {
  const HeadersScreeen({Key? key}) : super(key: key);

  @override
  State<HeadersScreeen> createState() => _HeadersScreeenState();
}

class _HeadersScreeenState extends State<HeadersScreeen> {
  List<String> tabsText = <String>[
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];
  tabMaker() {
    List<Tab> tabs = [];
    for (var i = 0; i < tabsText.length; i++) {
      tabs.add(Tab(
        text: tabsText[i],
      ));
    }
    return tabs;
  }

  List<Article> articles = <Article>[];
  String selectedCategory = '';
  final News news = News();
  int currentTabIndex = 0;
  Logger logger = Logger(printer: PrettyPrinter());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: tabsText.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('Headers'),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  isScrollable: true,
                  tabs: tabMaker(),
                  labelColor: Helpers.hexToColor('#393E46'),
                  indicatorColor: Helpers.hexToColor('#393E46'),
                  indicatorWeight: 3,
                  onTap: (index) {
                    setState(() {
                      currentTabIndex = index;
                    });
                  },
                ),
              ),
            ];
          },
          body: FutureBuilder<TopHeadlines>(
            future: news.getTopHeadLinesCategory(tabsText[currentTabIndex]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: SpinKitRotatingPlain(color: Colors.black87));
              } else if (snapshot.hasError) {
                logger.e('${snapshot.error}');
                return Center(
                    child: Text(
                        'An error occurred while loading data, error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final articles = snapshot.data!.articles;
                return LayoutBuilder(builder: (context, constraints) {
                  return NewsGrid(news: articles);
                });
              } else {
                logger.e('No data available.');
                return const Text('No data available.');
              }
            },
          ),
        ),
      ),
    );
  }
}
