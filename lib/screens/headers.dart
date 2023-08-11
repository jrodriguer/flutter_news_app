import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/news.dart';
import 'package:flutter_news_app/helpers/helpers.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:flutter_news_app/models/topheadlines.dart';
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
                backgroundColor: Helpers.hexToColor('#F7EFE5'),
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
                return LayoutBuilder(builder: (context, constraints) {
                  return GridView.builder(
                    itemCount: articles.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) => ItemTile(articles[index]),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: constraints.maxWidth > 700 ? 4 : 1,
                        childAspectRatio: 2),
                  );
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

class ItemTile extends StatelessWidget {
  final Article article;

  const ItemTile(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.grey.withOpacity(0.5),
        onTap: () {},
        leading: Container(
          width: 50,
          height: 30,
          color: Colors.grey.withOpacity(0.5),
          child: const Placeholder(
            color: Colors.green,
          ),
        ),
        title: Text(article.author ?? ''),
      ),
    );
  }
}
