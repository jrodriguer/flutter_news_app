import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Permissions extends StatefulWidget {
  const Permissions({super.key});

  @override
  State<StatefulWidget> createState() => _Permissions();
}

class _Permissions extends State<Permissions> {
  bool _request = false;
  bool _fetching = false;
  late NotificationSettings _settings;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
