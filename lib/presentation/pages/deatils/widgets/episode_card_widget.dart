import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class EpisodeCardWidget extends StatelessWidget {
  final String url;
  final String cover;
  final String name;

  EpisodeCardWidget({
    Key? key,
    required this.cover,
    required this.name,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final InAppBrowser browser = new InAppBrowser();

        browser.openUrlRequest(
          urlRequest: URLRequest(
            url: Uri.parse(this.url),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 5, left: 5),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              width: 250,
              height: 200,
              child: Image.network(
                this.cover,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 250,
              padding: EdgeInsets.all(15),
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment
                      .topCenter, // 10% of the width, so there are ten blinds.
                  colors: <Color>[
                    Colors.black,
                    Colors.transparent
                  ], // red to yellow
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    this.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}