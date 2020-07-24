import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:html/parser.dart';
import 'package:jiffy/jiffy.dart';

import 'details_page.dart';

class LandingPage extends StatelessWidget {
  var baseUrl = '';
  wp.WordPress wordPress;

  LandingPage() {
    if (Platform.isAndroid) {
      // Android-specific code
      baseUrl = 'http://10.0.2.2:8080';
    } else if (Platform.isIOS) {
      // iOS-specific code

      baseUrl = 'http://localhost:8080';
    } else {
      baseUrl = 'http://localhost:8080';
    }

    wordPress = wp.WordPress(
//      baseUrl: 'https://demo.wp-api.org',
      baseUrl: baseUrl,
    );
  }

  _fetchPosts() {
    Future<List<wp.Post>> posts = wordPress.fetchPosts(
        postParams: wp.ParamsPostList(
          context: wp.WordPressContext.view,
          pageNum: 1,
          perPage: 10,
        ),
        fetchAuthor: true,
        fetchFeaturedMedia: true,
        fetchComments: true);

    return posts;
  }

  _getPostImage(wp.Post post) {
    if (post.featuredMedia == null) {
      return SizedBox();
    }
    return FadeInImage.assetNetwork(
        placeholder: 'images/spinner.gif', image: post.featuredMedia.sourceUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _fetchPosts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<wp.Post>> snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return Container();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                wp.Post post = snapshot.data[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(post)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _getPostImage(post),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              post.title.rendered.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              parse(post.excerpt.rendered).documentElement.text,
                              style: TextStyle(wordSpacing: 3, fontSize: 18),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(Jiffy(post.date).fromNow(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    )),
                                Text(
                                  post.author.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
