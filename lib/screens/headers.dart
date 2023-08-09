import 'package:flutter/material.dart';

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
        );
      }),
    );
  }
}
