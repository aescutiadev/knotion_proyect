import 'package:dartz/dartz.dart';
import 'package:the_series_db/core/errors/failure.dart';
import 'package:the_series_db/domain/entities/serie_entity.dart';
import 'package:the_series_db/domain/interfaces/serie_interface.dart';

class GetDetailSerieUseCase {
  final SerieInterface serieInterface;

  GetDetailSerieUseCase(this.serieInterface);

  Future<Either<Failure, SerieEntity>> call({required String endPoint}) async {
    return serieInterface.getDetailSerie(endPoint: endPoint);
  }
}