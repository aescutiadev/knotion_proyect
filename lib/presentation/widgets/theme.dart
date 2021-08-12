import 'package:flutter/material.dart';
import 'package:the_series_db/presentation/widgets/constants.dart';

class ThemeApp {
  ThemeData lightTheme() => ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: PRIMARY_COLOR,
      centerTitle: true,
    ),
  );
}