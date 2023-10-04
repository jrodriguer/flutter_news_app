import 'package:flutter/material.dart';

import 'package:flutter_news_app/permissions.dart';
import 'package:flutter_news_app/token_monitor.dart';
import 'package:flutter_news_app/widgets/message_list.dart';
import 'package:flutter_news_app/widgets/meta_card.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  String? _token;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const MetaCard('Permissions', Permissions()),
                MetaCard(
                  'FCM Token',
                  TokenMonitor((token) {
                    _token = token;
                    return token == null
                        ? const CircularProgressIndicator()
                        : SelectableText(
                            token,
                            style: const TextStyle(fontSize: 12),
                          );
                  }),
                ),
                const MetaCard(
                  'Message Stream',
                  MessageList(),
                )
              ],
            )));
  }
}
