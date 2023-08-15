import 'package:flutter/material.dart';
import 'package:flutter_news_app/helpers/helpers.dart';
import 'package:flutter_news_app/models/article.dart';

class NewCard extends StatefulWidget {
  final Article article;

  const NewCard({super.key, required this.article});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  bool onFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Helpers.hexToColor('#F7F7F7'),
      elevation: 4.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      margin: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              child: Image.network(
                widget.article.urlToImage,
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                // if the image is null
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return GestureDetector(
                    onTap: () => onFavorites = true,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Icon(Icons.broken_image_outlined),
                      ),
                    ),
                  );
                },
              )),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              widget.article.title,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              widget.article.description,
              maxLines: 2,
              style: const TextStyle(color: Colors.black54, fontSize: 14.0),
            ),
          )
        ],
      ),
    );
  }
}
