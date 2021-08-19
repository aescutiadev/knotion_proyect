import 'package:dartz/dartz.dart';
import 'package:the_series_db/core/errors/failure.dart';
import 'package:the_series_db/domain/entities/serie_entity.dart';
import 'package:the_series_db/domain/interfaces/serie_interface.dart';

class GetListUseCase {
  final SerieInterface serieInterface;

  GetListUseCase(this.serieInterface);

  Future<Either<Failure,List<SerieEntity>>> call() async {
    return serieInterface.getListSerie();
  }
}