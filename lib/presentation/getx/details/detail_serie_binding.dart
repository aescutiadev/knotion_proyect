import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:the_series_db/core/connection/network_info.dart';
import 'package:the_series_db/data/datasource/serie_datasouce.dart';
import 'package:the_series_db/data/repositories/serie_repository_impl.dart';
import 'package:the_series_db/domain/interfaces/serie_interface.dart';
import 'package:the_series_db/domain/usecases/get_detail_of_the_serie_usecase.dart';
import 'package:the_series_db/presentation/getx/details/detail_serie_controller.dart';
import 'package:http/http.dart' as http;

class DetailsSerieBending extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSerieController>(
      () => DetailSerieController(getDetailSerieUseCase: Get.find()),
    );

    Get.lazyPut(
      () => GetDetailSerieUseCase(Get.find()),
    );

    Get.lazyPut<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: Get.find()),
    );

    Get.lazyPut(
      () => InternetConnectionChecker(),
    );

    Get.lazyPut<SerieInterface>(
      () => SerieReposotiryImplement(
        networkInfo: Get.find(),
        serieDataSource: Get.find(),
      ),
    );

    Get.lazyPut(
      () => SerieDataSourceImpl(Get.find()),
    );

    Get.lazyPut(
      () => http.Client(),
    );
  }
}
