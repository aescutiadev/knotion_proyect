import 'package:the_series_db/core/connection/network_info.dart';
import 'package:the_series_db/core/constants.dart';
import 'package:the_series_db/core/errors/exceptions.dart';
import 'package:the_series_db/data/datasource/serie_datasouce.dart';
import 'package:the_series_db/domain/entities/serie_entity.dart';
import 'package:the_series_db/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:the_series_db/domain/interfaces/serie_interface.dart';

class SerieReposotiryImplement implements SerieInterface {
  final SerieDataSourceImpl serieDataSource;
  final NetworkInfo networkInfo;

  SerieReposotiryImplement({
    required this.serieDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<SerieEntity>>> getListSerie() async {
    try {
      final isConnected = await networkInfo.isConnected;

      if (isConnected) {
        final response = await serieDataSource.getSerieList();

        return Right(response);
      } else {
        return Left(
          NoInternetConnectionFailure(
            message: NO_INTERNET_ERROR,
          ),
        );
      }
    } on ServerExeption {
      return Left(
        ServerFailure(
          message: SERVER_ERROR,
        ),
      );
    } on Exception {
      return Left(
        ServerFailure(
          message: SERVER_ERROR,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SerieEntity>> getDetailSerie({
    required String endPoint,
  }) async {
    try {
      final isConnected = await networkInfo.isConnected;
      if (isConnected) {
        final response = await serieDataSource.getDetailSerie(
          endPoint: endPoint,
        );

        return Right(response);
      } else {
        return Left(
          NoInternetConnectionFailure(
            message: NO_INTERNET_ERROR,
          ),
        );
      }
    } on ServerExeption {
      return Left(
        ServerFailure(
          message: SERVER_ERROR,
        ),
      );
    } on Exception {
      return Left(
        ServerFailure(
          message: SERVER_ERROR,
        ),
      );
    }
  }
}
