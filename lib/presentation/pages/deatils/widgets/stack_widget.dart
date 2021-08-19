import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import 'package:the_series_db/presentation/widgets/constants.dart';

class StackWidget extends GetWidget {
  final String imageCover;
  final String serieName;
  final String serieDesc;
  final String year;
  // final String publisherName;

  const StackWidget({
    Key? key,
    required this.imageCover,
    required this.serieName,
    required this.serieDesc,
    required this.year,
    // required this.publisherName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.height * 0.9,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                this.imageCover,
              ),
            ),
          ),
        ),
        Container(
          height: context.height * 0.9,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                PRIMARY_COLOR,
                Colors.transparent,
              ],
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(
            minHeight: context.height * 0.9,
            minWidth: context.width,
          ),
          padding: EdgeInsets.only(
            top: context.height * 0.50,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          width: context.width,
          decoration: BoxDecoration(color: PRIMARY_COLOR.withOpacity(0.7)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      this.serieName,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
                      shape: CircleBorder(),
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.blueGrey[100],
                    ),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo[900],
                      shape: CircleBorder(),
                    ),
                    child: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text(
                  this.year + " ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              HtmlWidget(
                this.serieDesc,
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                webViewJs: false,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
