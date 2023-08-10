import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/news_service.dart';
import 'package:flutter_news_app/helpers/helpers.dart';
import 'package:flutter_news_app/model/article_model.dart';
import 'package:flutter_news_app/model/topheadlines_model.dart';
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

  List<Article> news = <Article>[];
  String selectedCategory = '';
  final NewsService newsService = NewsService();
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
                  indicatorColor: Helpers.hexToColor('#674188'),
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
            future:
                newsService.getTopHeadLinesCategory(tabsText[currentTabIndex]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                logger.e('${snapshot.error}');
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final articles = snapshot.data!.articles;
                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(articles[index].title),
                      // Other fields...
                    );
                  },
                );
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
