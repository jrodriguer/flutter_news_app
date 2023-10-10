import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class TokenMonitor extends StatefulWidget {
  const TokenMonitor(this._builder, {super.key});

  final Widget Function(String? token) _builder;

  @override
  State<StatefulWidget> createState() => _TokenState();
}

class _TokenState extends State<TokenMonitor> {
  static final _log = Logger('TokenMonitor');

  String? _token;
  late Stream<String> _tokenStream;

  void setToken(String? token) {
    _log.info('Registration Token = $token');

    setState(() {
      _token = token;
    });
  }

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance
        .getToken(vapidKey: 'gbKTakLzABNT34US-G209tDvWa8pdknTx2nXhizW8dM')
        .then(setToken);

    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream.listen(setToken);
  }

  @override
  Widget build(BuildContext context) {
    return widget._builder(_token);
  }
}
