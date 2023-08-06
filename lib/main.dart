import 'package:flutter/material.dart';
import 'package:flutter_news_app/route_generator.dart';
import 'package:flutter_news_app/screens/main.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

typedef OnError = void Function(Exception exception);
Logger logger = Logger(
    filter: null,
    printer: PrettyPrinter(
        methodCount: 2, // Number of method calls to be displayed
        errorMethodCount: 8, // Number of method calls if stacktrace is provided
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: false),
    output: null);
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
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      onGenerateRoute: RouteGenerator.generateRoute,
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
