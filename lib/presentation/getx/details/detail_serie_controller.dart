import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:the_series_db/core/errors/failure.dart';
import 'package:the_series_db/domain/entities/serie_entity.dart';
import 'package:the_series_db/domain/usecases/get_detail_of_the_serie_usecase.dart';

class DetailSerieController extends GetxController with StateMixin {
  final GetDetailSerieUseCase getDetailSerieUseCase;

  final serieList = <SerieEntity>[].obs;

  final serieEntity = SerieEntity(
    aliases: "aliases",
    apiDetailUrl: "apiDetailUrl",
    countOfEpisodes: 0,
    dateAdded: DateTime(2021),
    dateLastUpdated: DateTime(2021),
    deck: "deck",
    description: "description",
    firstEpisode: Episode(
      apiDetailUrl: "apiDetailUrl",
      id: 0,
      name: "name",
      episodeNumber: "0",
    ),
    id: 0,
    image: Image(
      iconUrl: "iconUrl",
      mediumUrl: "mediumUrl",
      screenUrl: "screenUrl",
      screenLargeUrl: "screenLargeUrl",
      smallUrl: "smallUrl",
      superUrl: "superUrl",
      thumbUrl: "thumbUrl",
      tinyUrl: "tinyUrl",
      originalUrl: "originalUrl",
      imageTags: "imageTags",
    ),
    lastEpisode: Episode(
      apiDetailUrl: "apiDetailUrl",
      id: 0,
      name: "name",
      episodeNumber: "0",
    ),
    name: "name",
    siteDetailUrl: "siteDetailUrl",
    startYear: "startYear",
  ).obs;

  DetailSerieController({required this.getDetailSerieUseCase});

  @override
  void onInit() {
    super.onInit();

    change('cargando...', status: RxStatus.empty());
  }

  String getEpisodeNumberFormated(episode) {
    final String episodeNumber = episode.episodeNumber;
    String seasonText = "S";
    String episodeText = "E";

    if (episodeNumber.length <= 3) {
      seasonText += episodeNumber[0];
      episodeText += episodeNumber.substring(1, episodeNumber.length);
    } else {
      seasonText += episodeNumber.substring(0, 2);
      episodeText += episodeNumber.substring(2, episodeNumber.length);
    }

    return seasonText + "-" + episodeText + " " + episode.name;
  }

  void fetchDetailSerie(String endpoint) async {
    change('Cargando...', status: RxStatus.loading());

    final failureOrUseEntity = await getDetailSerieUseCase(endPoint: endpoint);

    _failureOrSerie(failureOrUseEntity);
  }

  _failureOrSerie(Either<Failure, SerieEntity> either) {
    return either.fold(
      (failure) => _error(failure),
      (list) => _getSerie(list),
    );
  }

  _getSerie(SerieEntity entity) {
    serieEntity.value = entity;

    update();

    change('Success', status: RxStatus.success());
  }

  _error(Failure failure) {
    String _errorMessage = _mapFailureToMessage(failure);

    change('Error', status: RxStatus.error(_errorMessage));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.message;

      case NoInternetConnectionFailure:
        return failure.message;

      default:
        return 'Unknown error';
    }
  }
}
