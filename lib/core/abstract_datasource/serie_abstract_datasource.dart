import 'package:the_series_db/domain/entities/serie_entity.dart';

abstract class SerieDataSource {
  Future<List<SerieEntity>> getSerieList();
}