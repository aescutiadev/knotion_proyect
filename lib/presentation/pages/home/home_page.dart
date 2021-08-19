import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_series_db/presentation/getx/list_series/list_series_controller.dart';
import 'package:the_series_db/presentation/pages/home/widgets/serie_card_widget.dart';
import 'package:the_series_db/presentation/widgets/constants.dart';
import 'package:the_series_db/presentation/widgets/message_container_widget.dart';

class HomePage extends GetWidget<ListSeriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Serie list'),
        backgroundColor: Colors.black.withOpacity(0.75),
        elevation: 0,
      ),
      body: Center(
        child: controller.obx(
          (state) => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 350,
            ),
            itemCount: controller.serieList.length,
            itemBuilder: (context, index) => SerieCardWidget(
              url: controller.serieList[index].apiDetailUrl,
              cover: controller.serieList[index].image.superUrl,
              serieName: controller.serieList[index].name,
              episodeCount:
                  controller.serieList[index].countOfEpisodes.toString(),
            ),
          ),
          onError: (error) => Center(
            child: Container(
              width: 500,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MessageContainerWidget(
                    message: error.toString(),
                    type: MessageType.ERROR,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      controller.fetchSeriesList();
                    },
                    icon: Icon(Icons.autorenew_outlined),
                    label: Text("Try again"),
                  )
                ],
              ),
            ),
          ),
          onEmpty: Center(
              child: Text(
            'No series found',
            style: TextStyle(
              color: Colors.white,
            ),
          )),
          onLoading: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
