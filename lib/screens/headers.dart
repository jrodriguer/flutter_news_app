import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/news_service.dart';
import 'package:flutter_news_app/main.dart';
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
  Logger logger = Logger(printer: PrettyPrinter());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: tabsText.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TabBar(tabs: tabMaker(), isScrollable: true),
              ],
            ),
          ),
          body: FutureBuilder<TopHeadlines>(
            future: newsService.getTopHeadLinesCategory(tabsText[0]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
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
                return const Text('No data available.');
              }
            },
          ),
        );
      }),
    );
  }
}
