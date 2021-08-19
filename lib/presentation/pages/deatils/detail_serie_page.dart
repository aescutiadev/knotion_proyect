import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:the_series_db/core/constants.dart';
import 'package:the_series_db/presentation/getx/details/detail_serie_controller.dart';
import 'package:the_series_db/presentation/pages/deatils/widgets/episode_card_widget.dart';
import 'package:the_series_db/presentation/pages/deatils/widgets/stack_widget.dart';
import 'package:the_series_db/presentation/widgets/constants.dart';
import 'package:the_series_db/presentation/widgets/message_container_widget.dart';

class DetailsSeriePage extends GetWidget<DetailSerieController> {
  final url = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.fetchDetailSerie(url);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: PRIMARY_COLOR,
      body: Center(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: controller.obx(
            (state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                StackWidget(
                  imageCover: controller.serieEntity.value.image.originalUrl,
                  serieName: controller.serieEntity.value.name,
                  serieDesc: controller.serieEntity.value.description,
                  year: controller.serieEntity.value.startYear,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Lista de episodios (${controller.serieEntity.value.countOfEpisodes})",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  margin: EdgeInsets.only(bottom: 25, top: 20),
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.serieEntity.value.episodes != null
                        ? controller.serieEntity.value.episodes!.length
                        : 0,
                    itemBuilder: (context, index) {
                      return EpisodeCardWidget(
                        url: controller
                            .serieEntity.value.episodes![index].siteDetailUrl
                            .toString(),
                        cover:
                            controller.serieEntity.value.image.screenLargeUrl,
                        name: controller.getEpisodeNumberFormated(
                          controller.serieEntity.value.episodes![index],
                        ),
                      );
                    },
                  ),
                ),
              ],
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
                        controller.fetchDetailSerie(url);
                      },
                      icon: Icon(Icons.autorenew_outlined),
                      label: Text("Try again"),
                    )
                  ],
                ),
              ),
            ),
            onEmpty: Center(child: Text('No details found')),
            onLoading: Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}