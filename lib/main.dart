import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/main.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

bool firstTime = false;
typedef OnError = void Function(Exception exception);
Logger logger = Logger(
  printer: PrettyPrinter(),
);

logs() {
  if (kReleaseMode) {
    Logger.level = Level.warning;
  }
  Logger.addLogListener((record) {
    debugPrint('${record.level.name}: ${record.time}: '
        // '${record.loggerName}: '
        '${record.message}');
  });
}

Future<void> main() async {
  logs();
  logger.i('Going start app');
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

  @override
  Widget build(BuildContext context) {
    return const MainScreen();
  }
}
