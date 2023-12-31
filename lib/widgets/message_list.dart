import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<RemoteMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _messages = [..._messages, message];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_messages.isEmpty) {
      return const Text(
        'No messages received',
        style: TextStyle(fontSize: 16),
      );
    }

    return ListView.builder(
        shrinkWrap: true,
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          RemoteMessage message = _messages[index];

          return ListTile(
            title: Text(
                message.messageId ?? 'no RemoteMessage.messageId available'),
            subtitle: Text(
              message.sentTime?.toString() ?? DateTime.now().toString(),
            ),
          );
        });
  }
}
