import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:flutter_news_app/services/data_local.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NewsGrid extends StatefulWidget {
  final List<Article> news;
  final bool onFavorites;

  const NewsGrid({Key? key, required this.news, required this.onFavorites})
      : super(key: key);

  @override
  State<NewsGrid> createState() => _NewsGridState();
}

class _NewsGridState extends State<NewsGrid> {
  final DataLocal dataLocal = DataLocal();
  String favoriteTile = 'In favorites';

  void _showNewsDetails(int index) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return _buildNewsDetailsSheet(widget.news[index]);
      },
    );
  }

  Widget _buildNewsDetailsSheet(Article article) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      height: MediaQuery.of(context).size.height / 2,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
            child: Text(
              article.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 17),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            child: Divider(
              color: Colors.grey,
              height: 5,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                    onTap: () async {
                      FlutterClipboard.copy(article.url).then((value) {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Text Copied'),
                          ),
                        );
                      });
                    },
                    child: const ListTile(
                      leading: Icon(Icons.copy),
                      title: Text('Copy Link'),
                    )),
                GestureDetector(
                    onTap: () async {
                      if (widget.onFavorites) {
                        await dataLocal.deleteNew(article);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Delete favorite'),
                          ),
                        );
                      } else {
                        favoriteTile = 'Remove from favorites';
                        await dataLocal.saveNew(article);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to favorites'),
                          ),
                        );
                      }
                    },
                    child: ListTile(
                      leading: const Icon(Icons.favorite_border_outlined),
                      title: Text(favoriteTile),
                    )),
              ],
            ),
          ),
          const Spacer(),
          //     GestureDetector(
          //       onTap: () => Navigator.pop(context),
          //       child: Container(
          //         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
          //         child: const Text(
          //           "Close",
          //           style: TextStyle(fontWeight: FontWeight.w600),
          //         ),
          //       ),
          //     ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MasonryGridView.count(
        crossAxisCount: constraints.maxWidth > 900.0
            ? 4
            : constraints.maxWidth > 700.0
                ? 2
                : 1,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        itemCount: widget.news.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onDoubleTap: () => _showNewsDetails(index),
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(children: [
                  ClipRRect(
                    child: Image.network(
                      widget.news[index].urlToImage,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return const SizedBox(
                          width: 200,
                          height: 100,
                          child: Icon(Icons.broken_image_outlined),
                        );
                      },
                    ),
                  ),
                  Container(
                      margin:
                          const EdgeInsets.only(top: 14.976, bottom: 14.976),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.news[index].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.only(bottom: 12.8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.news[index].description,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ))
                ])),
          );
        },
      );
    });
  }
}
