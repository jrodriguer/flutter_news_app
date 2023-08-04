import 'package:flutter/material.dart';
import 'package:flutter_news_app/helpers/helpers.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  var settingsController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // settingsController = context.watch<SettingsController>();

    const List<Widget> screens = <Widget>[
      Icon(
        Icons.person,
        size: 150,
      ),
      Icon(
        Icons.public,
        size: 150,
      ),
      Icon(
        Icons.favorite_border,
        size: 150,
      ),
    ];

    int selectedIndex = 0;

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Helpers.hexToColor('#EFE5DE'),
      body: Center(child: screens.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        mouseCursor: SystemMouseCursors.grab,
        selectedFontSize: 20,
        selectedIconTheme:
            const IconThemeData(color: Colors.lightBlue, size: 40),
        selectedItemColor: Colors.lightBlue,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: const IconThemeData(
          color: Colors.blueGrey,
        ),
        unselectedItemColor: Colors.blueGrey,
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
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
