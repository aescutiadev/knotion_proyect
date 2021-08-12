import 'package:the_series_db/core/exceptions.dart';
import 'package:the_series_db/data/datasource/serie_datasouce.dart';
import 'package:the_series_db/domain/entities/serie_entity.dart';
import 'package:the_series_db/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:the_series_db/domain/interfaces/serie_interface.dart';

class SerieReposotiryImplement implements SerieInterface {
  final SerieDataSourceImpl serieDataSource;

  SerieReposotiryImplement(this.serieDataSource);

  @override
  Future<Either<Failure, List<SerieEntity>>> getListSerie() async {
    try {
      final response = await serieDataSource.getSerieList();

      return Right(response);
    } on ServerExeption {
      return Left(ServerFailure(message: 'Error in get list data'));
    } 
  }

  @override
  Future<Either<Failure, SerieEntity>> getDetailSerie({required String endPoint}) async {
    try {
      final response = await serieDataSource.getDetailSerie(endPoint: endPoint);

      return Right(response);
    } on ServerExeption {
      return Left(ServerFailure(message: 'Error in get list data'));
    } on Exception {
      return Left(ServerFailure(message: 'Error desconocido'));
    }
  }
}
