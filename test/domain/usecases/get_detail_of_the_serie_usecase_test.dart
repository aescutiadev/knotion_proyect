import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_series_db/core/errors/failure.dart';
import 'package:the_series_db/domain/entities/serie_entity.dart';
import 'package:the_series_db/domain/interfaces/serie_interface.dart';
import 'package:the_series_db/domain/usecases/get_detail_of_the_serie_usecase.dart';

import 'get_detail_of_the_serie_usecase_test.mocks.dart';

@GenerateMocks([SerieInterface])
void main() {
  GetDetailSerieUseCase? getDetailSerieUseCase;

  MockSerieInterface? mockSerieInterface;

  setUp(() {
    mockSerieInterface = MockSerieInterface();
    getDetailSerieUseCase = GetDetailSerieUseCase(mockSerieInterface!);
  });

  final tSerieDetail = SerieEntity(
    characters: [
      Characteres(
        apiDetailUrl: 'apiDetailUrl',
        id: 1,
        name: 'name',
        count: 'count',
      )
    ],
    episodes: [
      Episode(
        apiDetailUrl: 'apiDetailUrl',
        id: 1,
        name: 'name',
        episodeNumber: 'episodeNumber',
      )
    ],
    aliases: 'aliases',
    apiDetailUrl: 'apiDetailUrl',
    countOfEpisodes: 01,
    dateAdded: DateTime(2017, 9, 7, 17, 30),
    dateLastUpdated: DateTime(2017, 9, 7, 17, 30),
    deck: 'deck',
    description: 'description',
    firstEpisode: Episode(
      apiDetailUrl: 'apiDetailUrl',
      id: 2,
      name: 'name',
      siteDetailUrl: 'siteDetailUrl',
      episodeNumber: 'episodeNumber',
    ),
    id: 1,
    image: Image(
      iconUrl: 'iconUrl',
      mediumUrl: 'mediumUrl',
      screenUrl: 'screenUrl',
      screenLargeUrl: 'screenLargeUrl',
      smallUrl: 'smallUrl',
      superUrl: 'superUrl',
      thumbUrl: 'thumbUrl',
      tinyUrl: 'tinyUrl',
      originalUrl: 'originalUrl',
      imageTags: 'imageTags',
    ),
    lastEpisode: Episode(
      apiDetailUrl: 'apiDetailUrl',
      id: 2,
      name: 'name',
      siteDetailUrl: 'siteDetailUrl',
      episodeNumber: 'episodeNumber',
    ),
    name: 'name',
    publisher: Publisher(
      apiDetailUrl: 'apiDetailUrl',
      id: 5,
      name: 'name',
    ),
    siteDetailUrl: 'siteDetailUrl',
    startYear: 'startYear',
  );

  final tEndPoint = 'url-fake';

  group('Dev Detail Serie', () {
    test('get details of the serie is successfuly', () async {
      when(mockSerieInterface!.getDetailSerie(endPoint: tEndPoint))
          .thenAnswer((_) async => Right(tSerieDetail));

      final result = await getDetailSerieUseCase!(endPoint: tEndPoint);

      expect(result, Right(tSerieDetail));
    });

    test('get details of the serie is failure', () async {
      when(mockSerieInterface!.getDetailSerie(endPoint: tEndPoint)).thenAnswer(
          (_) async => Left(ServerFailure(message: 'Error in get data')));

      final result = await getDetailSerieUseCase!(endPoint: tEndPoint);

      expect(result, Left(ServerFailure(message: 'Error in get data')));
    });
  });
}
