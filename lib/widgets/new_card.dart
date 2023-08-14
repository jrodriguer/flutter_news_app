import 'package:flutter/material.dart';
import 'package:flutter_news_app/constants/size_constants.dart';
import 'package:flutter_news_app/constants/ui_constants.dart';
import 'package:flutter_news_app/models/article.dart';

class NewCard extends StatelessWidget {
  final Article article;
  final int index;
  final bool onFavorites;

  const NewCard(
      {super.key,
      required this.article,
      required this.index,
      this.onFavorites = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Sizes.dimen_4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10))),
      margin: const EdgeInsets.fromLTRB(
          Sizes.dimen_16, 0, Sizes.dimen_16, Sizes.dimen_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Sizes.dimen_10),
                  topRight: Radius.circular(Sizes.dimen_10)),
              child: Image.network(
                article.urlToImage,
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                // if the image is null
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Sizes.dimen_10)),
                    child: const SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Icon(Icons.broken_image_outlined),
                    ),
                  );
                },
              )),
          vertical15,
          Padding(
            padding: const EdgeInsets.all(Sizes.dimen_6),
            child: Text(
              article.title,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: Sizes.dimen_20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Sizes.dimen_6),
            child: Text(
              article.description,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.black54, fontSize: Sizes.dimen_14),
            ),
          )
        ],
      ),
    );
  }
}
