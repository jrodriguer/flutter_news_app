import 'package:flutter/material.dart';
import 'package:flutter_news_app/helpers/helpers.dart';
import 'package:flutter_news_app/screens/favorites.dart';
import 'package:flutter_news_app/screens/headers.dart';
import 'package:flutter_news_app/screens/personal.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // settingsController = context.watch<SettingsController>();

    const List<Widget> _buildBody = <Widget>[
      PersonalScreen(),
      HeadersScreeen(),
      FavoritesScreen()
    ];

    return Scaffold(
      backgroundColor: Helpers.hexToColor('#FFFBF5'),
      body: IndexedStack(
        index: index,
        children: _buildBody,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Helpers.hexToColor('#F7EFE5'),
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        elevation: 16.0,
        showUnselectedLabels: true,
        selectedItemColor: Helpers.hexToColor('#674188'),
        unselectedItemColor: Helpers.hexToColor('#C3ACD0'),
        mouseCursor: SystemMouseCursors.grab,
        selectedFontSize: 20,
        selectedIconTheme:
            IconThemeData(color: Helpers.hexToColor('#674188'), size: 40),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: IconThemeData(
          color: Helpers.hexToColor('#C3ACD0'),
        ),
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
