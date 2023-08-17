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

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2), // if you need this
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      margin: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.article.title,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          ClipRRect(
              child: Image.network(
            widget.article.urlToImage,
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
            // if the image is null
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return InkWell(
                onTap: () => {
                  setState(() {
                    onFavorites = true;
                  })
                },
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
          // const SizedBox(height: 15.0),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
            child: Text(
              widget.article.description,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       // TextButton.icon(
          //       //   onPressed: () {},
          //       //   icon: const Icon(Icons.play_circle_outline),
          //       //   label: const Text('Start'),
          //       // ),
          //       IconButton(
          //         icon: const Icon(Icons.favorite_border),
          //         tooltip: 'Add to favorites',
          //         onPressed: () {},
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.share),
          //         tooltip: 'Share',
          //         onPressed: () {},
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
