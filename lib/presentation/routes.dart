import 'package:get/get.dart';
import 'package:the_series_db/presentation/getx/details/detail_serie_binding.dart';
import 'package:the_series_db/presentation/getx/list_series/list_series_binding.dart';
import 'package:the_series_db/presentation/pages/deatils/detail_serie_page.dart';
import 'package:the_series_db/presentation/pages/home/home_page.dart';

List<GetPage<dynamic>>? routes() => [
      GetPage(
        name: '/',
        page: () => HomePage(),
        binding: ListSeriesBinding(),
      ),
      GetPage(
        name: '/details',
        page: () => DetailsSeriePage(),
        binding: DetailsSerieBending(),
      ),
    ];
