import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_series_db/core/errors/failure.dart';
import 'package:the_series_db/domain/entities/serie_entity.dart';
import 'package:the_series_db/domain/interfaces/serie_interface.dart';
import 'package:the_series_db/domain/usecases/get_list_of_series_usecase.dart';

import 'get_list_of_series_usecase_test.mocks.dart';

@GenerateMocks([SerieInterface])
void main() {
  GetListUseCase? listUseCase;

  MockSerieInterface? mockSerieInterface;

  setUp(() {
    mockSerieInterface = MockSerieInterface();
    listUseCase = GetListUseCase(mockSerieInterface!);
  });

  final tSerie = SerieEntity(
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

  final serieList = <SerieEntity>[];

  group('Dev List series', () {
    test('Get list series successfuly', () async {
      when(mockSerieInterface!.getListSerie())
          .thenAnswer((_) async => Right(serieList));

      final result = await listUseCase!();

      expect(result, Right(serieList));
    });

    test('Get list series failure', () async {
      when(mockSerieInterface!.getListSerie()).thenAnswer((_) async =>
          Left(ServerFailure(message: 'Failure in get list series')));

      final result = await listUseCase!();

      expect(
        result,
        Left(ServerFailure(message: 'Failure in get list series')),
      );
    });
  });
}
