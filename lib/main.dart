import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/helpers/helpers.dart';
import 'package:flutter_news_app/views/favorites_screen.dart';
import 'package:flutter_news_app/views/headers_screen.dart';
import 'package:flutter_news_app/views/personal_screen.dart';
import 'package:logging/logging.dart';
import 'package:sizer/sizer.dart';

void main() {
  if (kReleaseMode) {
    Logger.root.level = Level.WARNING;
  }
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: '
      '${record.loggerName}: '
      '${record.message}: ');
  });

  _log.info('Going full screen');

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

Logger _log = Logger('main.dart');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(useMaterial3: true, fontFamily: 'OpenSans'),
        home: const MyHomePage(),
      );
    });
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
          _log.info(() => 'Clicked on bottom navigation bar, index position: $i');
          setState(() {
            index = i;
          });
        },
        elevation: 16,
        showUnselectedLabels: true,
        mouseCursor: SystemMouseCursors.grab,
        selectedFontSize: 16,
        selectedItemColor: Helpers.hexToColor('#393E46'),
        selectedIconTheme:
            IconThemeData(color: Helpers.hexToColor('#393E46'), size: 32),
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
