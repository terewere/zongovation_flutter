import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  wp.Post post;

  DetailsPage(this.post);

  _getPostImage() {
    if (post.featuredMedia == null) {
      return SizedBox(
        height: 10,
      );
    } else {
      return Image.network(post.featuredMedia.sourceUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: PlatformScaffold(
        appBar: PlatformAppBar(
          backgroundColor: Colors.white,
          android: (_) => MaterialAppBarData(
              iconTheme: IconThemeData(color: Theme.of(context).primaryColor)),
          title: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/logo.jpg'),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 150,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Author',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      post.author.name ?? 'Undefined',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      Divider(
                        height: 80,
                        color: Theme.of(context).accentColor,
                        thickness: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Zongovation Blog',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    post.title.rendered.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      wordSpacing: 3,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    Jiffy(post.date).fromNow(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  _getPostImage(),

                  SizedBox(
                    height: 30,
                  ),
                  Html(
                      style: {
                        "p": Style(
                          wordSpacing: 3,
                          fontSize: FontSize(18),
                        ),
                      },
                      data: post.content.rendered,
                      onLinkTap: (String url) {
                        _launchUrl(url);
                      }),
//                Text(
//                  post.content.rendered.toString() ?? "No Contents",
//                  style: TextStyle(
//                    fontSize: 16,
//                    wordSpacing: 3,
//                  ),
//                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_launchUrl(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    throw 'Cannot launch $link';
  }
}
