import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:the_series_db/core/connection/network_info.dart';
import 'package:the_series_db/data/datasource/serie_datasouce.dart';
import 'package:the_series_db/data/repositories/serie_repository_impl.dart';
import 'package:the_series_db/domain/interfaces/serie_interface.dart';
import 'package:the_series_db/domain/usecases/get_list_of_series_usecase.dart';
import 'package:the_series_db/presentation/getx/list_series/list_series_controller.dart';

class ListSeriesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListSeriesController>(() => ListSeriesController(Get.find()));
    Get.lazyPut(() => GetListUseCase(Get.find()));
    Get.lazyPut<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: Get.find()),
    );
    Get.lazyPut(() => InternetConnectionChecker());
    Get.lazyPut<SerieInterface>(
      () => SerieReposotiryImplement(
        serieDataSource: Get.find(),
        networkInfo: Get.find(),
      ),
    );
    Get.lazyPut(() => SerieDataSourceImpl(Get.find()));
    Get.lazyPut(() => http.Client());
  }
}
