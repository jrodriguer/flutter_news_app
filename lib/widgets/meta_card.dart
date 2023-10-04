import 'package:flutter/material.dart';

class MetaCard extends StatelessWidget {
  final String _title;
  final Widget _children;

  const MetaCard(this._title, this._children, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 0,
        // shape: RoundedRectangleBorder(
        //   side: BorderSide(
        //     color: Theme.of(context).colorScheme.outline
        //   ),
        //
        //     borderRadius: const BorderRadius.all(Radius.zero),
        // ),
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(_title, style: const TextStyle(fontSize: 16),),
              ),
              _children,
            ],
          ),
        ),
      ),
    );
  }
}