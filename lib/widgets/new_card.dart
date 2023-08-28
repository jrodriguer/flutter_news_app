import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article.dart';

class NewCard extends StatefulWidget {
  final Article article;

  const NewCard({super.key, required this.article});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  bool onFavorites = false;
  ListTileTitleAlignment? titleAlignment;
  List<PopupMenuEntry<Function>> getMenuItems() {
    if (onFavorites) {
      return [
        PopupMenuItem<Function>(
          value: () {},
          child: const Text('Delete Favorite'),
        ),
      ];
    } else {
      return [
        PopupMenuItem<Function>(
          value: () {
            // Handle favorite logic here
          },
          child: const Text('Favorite'),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      margin: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            titleAlignment: titleAlignment,
            title: Text(widget.article.title),
            //     style: const TextStyle(
            //         color: Colors.black,
            //         fontSize: 18.0,
            //         fontWeight: FontWeight.w500),
            //   ),
            trailing: PopupMenuButton<Function>(
              itemBuilder: (BuildContext context) =>
                  getMenuItems() +
                  [
                    PopupMenuItem<Function>(
                      value: () {
                        // Handle share logic here
                      },
                      child: const Text('Share'),
                    ),
                    PopupMenuItem<Function>(
                      value: () {
                        // Handle cancel logic here
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
              onSelected: (Function action) {
                action.call();
              },
            ),
          ),
          ClipRRect(
              child: Image.network(
            widget.article.urlToImage,
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: const SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Icon(Icons.broken_image_outlined),
                ),
              );
            },
          )),
          // TODO: Refactor supporting text content
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
              child: Text(widget.article.description,
                  maxLines: 2,
                  // style: const TextStyle(
                  //     color: Colors.black54,
                  //     fontSize: 14.0,
                  //     fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
