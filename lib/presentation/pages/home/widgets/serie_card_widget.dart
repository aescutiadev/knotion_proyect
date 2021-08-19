import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SerieCardWidget extends StatelessWidget {
  final String url;

  final String cover;
  final String serieName;
  final String episodeCount;

  const SerieCardWidget({
    Key? key,
    required this.url,
    required this.cover,
    required this.serieName,
    required this.episodeCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/details", arguments: this.url);
      },
      child: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 250,
                ),
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      this.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 0,
              child: Container(
                height: 75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.serieName,
                      softWrap: true,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Episodios: ${this.episodeCount}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
