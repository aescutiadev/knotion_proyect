import 'package:get/get.dart';
import 'package:the_series_db/presentation/getx/list_series/list_series_binding.dart';
import 'package:the_series_db/presentation/pages/home/home_page.dart';

List<GetPage<dynamic>>? routes() => [
      GetPage(name: '/', page: () => HomePage(), binding: ListSeriesBinding()),
    ];
