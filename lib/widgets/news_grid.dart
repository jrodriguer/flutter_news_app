import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/article.dart';
// import 'package:flutter_news_app/widgets/new_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NewsGrid extends StatelessWidget {
  final List<Article> news;

  const NewsGrid({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: news.length,
        itemBuilder: (context, index) {
          // return NewCard(
          //   article: news[index],
          // );
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  news[index].urlToImage,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return const SizedBox(
                      width: 200,
                      height: 100,
                      child: ColoredBox(
                        color: Colors.black38,
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
                      news[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Share to",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 17,
                                ),
                                SizedBox(
                                  height: 100.0,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    // itemCount: sharePosts.length,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        width: 90,
                                        child: Column(children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 35,
                                            backgroundImage: AssetImage(
                                              'assets/images/${news[index].urlToImage}',
                                            ),
                                          ),
                                          const Spacer(),
                                          // Text(
                                          //   sharePosts[index].id,
                                          //   overflow:
                                          //       TextOverflow.ellipsis,
                                          //   style: const TextStyle(
                                          //       fontSize: 12,
                                          //       color: Colors.black,
                                          //       fontWeight:
                                          //           FontWeight.w500),
                                          // )
                                        ]),
                                      );
                                    },
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 15),
                                  child: Divider(
                                    color: Colors.grey,
                                    height: 5,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "This Pin was inspired by your recent activity",
                                        style: TextStyle(fontSize: 14),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Hide",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        "Report",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 26),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey.shade300),
                                    child: const Text("Close",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.more_horiz),
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
