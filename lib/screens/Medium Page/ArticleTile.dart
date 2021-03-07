import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleTile extends StatelessWidget {
  final String title, url, urlToImage, author;
  ArticleTile({this.title, this.url, this.urlToImage, this.author});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String link = url.toString();
        if (await canLaunch(link)) {
          await launch(link);
        } else {
          throw 'Could not launch $link';
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            child: Stack(
              children: [
                Image.network(urlToImage,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    //color: ColorFilter.mode(Colors.black54, BlendMode.darken),
                    color: Color.fromRGBO(10, 10, 10, 0.8),
                    colorBlendMode: BlendMode.darken),
                Center(
                  child: Container(
                    color: Colors.transparent,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                          child: Text(
                            author,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
