import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_series_db/core/exceptions.dart';
import 'package:the_series_db/core/failure.dart';
import 'package:the_series_db/data/datasource/serie_datasouce.dart';
import 'package:the_series_db/data/repositories/serie_repository_impl.dart';
import 'package:the_series_db/domain/entities/serie_entity.dart';

import 'serie_repository_impl_test.mocks.dart';

@GenerateMocks([SerieDataSourceImpl])
void main() {
  SerieReposotiryImplement? serieReposotiryImplement;

  MockSerieDataSourceImpl? mockSerieDataSourceImpl;

  setUp(() {
    mockSerieDataSourceImpl = MockSerieDataSourceImpl();
    serieReposotiryImplement =
        SerieReposotiryImplement(mockSerieDataSourceImpl!);
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
    test('the get data is successfuly', () async {
      when(mockSerieDataSourceImpl!.getSerieList())
          .thenAnswer((_) async => serieList);

      final result = await serieReposotiryImplement!.getListSerie();

      expect(result, Right(serieList));
    });

    test('the get data is failure', () async {
      when(mockSerieDataSourceImpl!.getSerieList()).thenThrow(ServerExeption());

      final result = await serieReposotiryImplement!.getListSerie();

      expect(result, Left(ServerFailure(message: 'Error in get list data')));
    });
  });
}
