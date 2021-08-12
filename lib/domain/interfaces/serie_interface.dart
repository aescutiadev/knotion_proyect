import 'package:dartz/dartz.dart';
import 'package:the_series_db/core/failure.dart';
import 'package:the_series_db/domain/entities/serie_entity.dart';

abstract class SerieInterface {
  Future<Either<Failure, List<SerieEntity>>> getListSerie();
  Future<Either<Failure, SerieEntity>> getDetailSerie({required String endPoint});
}