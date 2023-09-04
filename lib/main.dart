import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/helpers/helpers.dart';
import 'package:flutter_news_app/views/favorites_screen.dart';
import 'package:flutter_news_app/views/headers_screen.dart';
import 'package:flutter_news_app/views/personal_screen.dart';
import 'package:logger/logger.dart';

typedef OnError = void Function(Exception exception);
Logger logger = Logger(printer: PrettyPrinter());
Logger loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

logs() {
  if (kReleaseMode) {
    Logger.level = Level.warning;
  }

  Logger.addLogListener((record) {
    debugPrint('${record.level.name}: ${record.time}: '
        '${record.message}');
  });
}

Future<void> main() async {
  logs();
  loggerNoStack.i('Going full screen');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, fontFamily: 'OpenSans'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    const List<Widget> buildBody = <Widget>[
      PersonalScreen(),
      HeadersScreen(),
      FavoritesScreen()
    ];

    return Scaffold(
      body: IndexedStack(
        index: index,
        children: buildBody,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        elevation: 16.0,
        showUnselectedLabels: true,
        mouseCursor: SystemMouseCursors.grab,
        selectedFontSize: 16,
        selectedItemColor: Helpers.hexToColor('#393E46'),
        selectedIconTheme:
            IconThemeData(color: Helpers.hexToColor('#393E46'), size: 32.0),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Headers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
