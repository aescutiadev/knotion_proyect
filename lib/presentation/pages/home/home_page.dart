import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_series_db/presentation/getx/list_series/list_series_controller.dart';

class HomePage extends GetWidget<ListSeriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de series'),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: controller.serieList.length,
          itemBuilder: (c, i) => GestureDetector(
            onTap: () {
              print(controller.serieList[i].apiDetailUrl);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              height: 200,
              child: Row(
                children: [
                  Flexible(
                    child: Image.network(
                      controller.serieList[i].image.originalUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          alignment: Alignment.center,
                          child: Text(controller.serieList[i].name),
                        ),
                        Container(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Episodios: '),
                              Text(
                                controller.serieList[i].countOfEpisodes
                                    .toString(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onError: (error) => Center(child: Text('$error')),
        onEmpty: Center(child: Text('Está vacío')),
        onLoading: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
