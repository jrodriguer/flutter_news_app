import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.person_pin_circle_outlined)),
            Tab(icon: Icon(Icons.circle)),
            Tab(icon: Icon(Icons.heart_broken_outlined))
          ]),
          title: const Text('Tabs Demo'),
        ),
        // body: const TabBarView(
        //   children: [
        //     Text('Tabs Demo 1'),
        //     Text('Tabs Demo 2'),
        //     Text('Tabs Demo 3'),
        //   ],
        // ),
      ),
    );
  }
}
