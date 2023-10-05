import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/permissions.dart';
import 'package:flutter_news_app/token_monitor.dart';
import 'package:flutter_news_app/widgets/message_list.dart';
import 'package:flutter_news_app/widgets/meta_card.dart';
import 'package:logging/logging.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  static final _log = Logger('PersonalScreen');

  String? _token;

  Future<void> onActionSelected(String value) async {
    switch (value) {
      case 'subscribe':
        {
          _log.info('FlutterFire Messaging subscribing to topic "all_users".');
          await FirebaseMessaging.instance.subscribeToTopic('all_users');
          _log.fine(
                  () => 'FlutterFire Messaging subscribing to topic "all_users" successfully.');
        }
        break;
      case 'unsubscribe':
        {
          _log.info('FlutterFire Messaging unsubscribing from topic "all_users".');
          await FirebaseMessaging.instance.unsubscribeFromTopic('all_users');
          _log.fine(
                  () => 'FlutterFire Messaging unsubscribing to topic "all_users" successfully.');
        }
        break;
      case 'get_apns_token':
        {
          if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            _log.info('FlutterFire Messaging getting APNs token...');
            String? token = await FirebaseMessaging.instance.getAPNSToken();
            _log.fine(
                    () => 'FlutterFire Messaging got APNs token: $token');
          } else {
           _log.severe('FlutterFire Messaging getting an APNs token is only supported on iOS and macOS platforms.');
          }
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: onActionSelected,
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'subscribe',
                  child: Text('Subscribe to topic'),
                ),
                const PopupMenuItem(
                  value: 'unsubscribe',
                  child: Text('Unsubscribe to topic'),
                ),
                const PopupMenuItem(
                  value: 'get_apns_token',
                  child: Text('Get APNs token (Apple only)'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const MetaCard(
                'Permissions',
                Permissions(),
              ),
              MetaCard(
                'FCM Token',
                TokenMonitor((token) {
                  _token = token;
                  return token == null
                      ? const CircularProgressIndicator()
                      : SelectableText(
                          token,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        );
                }),
              ),
              const MetaCard(
                'Message Stream',
                MessageList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
