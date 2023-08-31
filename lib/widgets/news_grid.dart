import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NewsGrid extends StatefulWidget {
  final List<Article> news;

  const NewsGrid({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  State<NewsGrid> createState() => _NewsGridState();
}

class _NewsGridState extends State<NewsGrid> {
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
            padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0),
            child: Text(
              article.title,
              style: const TextStyle(
                  fontFamily: 'Martel',
                  fontSize: 16,
                  fontStyle: FontStyle.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 12.0, top: 7.0, end: 12.0),
            child: Text(
              article.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontFamily: 'Sintony',
                  fontSize: 14,
                  fontStyle: FontStyle.normal),
            ),
          ),
          const SizedBox(height: 17),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
            child: Divider(
              color: Colors.grey,
              height: 5,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.copy),
                  title: Text('Copy Link'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border_outlined),
                  title: Text('Favorite'),
                ),
              ],
            ),
          ),
          const Spacer(),
          // GestureDetector(
          //   onTap: () => Navigator.pop(context),
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(30),
          //       color: Colors.grey.shade300,
          //     ),
          //     child: const Text(
          //       "Close",
          //       style: TextStyle(fontWeight: FontWeight.w600),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: widget.news.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.5),
                child: Image.network(
                  widget.news[index].urlToImage,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return const SizedBox(
                      width: 200,
                      height: 100,
                      child: ColoredBox(
                        color: Colors.grey,
                        child: Icon(Icons.broken_image_outlined),
                      ),
                    );
                  },
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.news[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showNewsDetails(index),
                    child: const Column(
                      children: [
                        Icon(Icons.more_horiz),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
