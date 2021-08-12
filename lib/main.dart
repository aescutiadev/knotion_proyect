import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_series_db/presentation/getx/list_series/list_series_binding.dart';
import 'package:the_series_db/presentation/routes.dart';
import 'package:the_series_db/presentation/widgets/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      getPages: routes(),
      theme: ThemeApp().lightTheme(),
      initialRoute: '/',
      initialBinding: ListSeriesBinding(),
    );
  }
}
