import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_series_db/core/connection/network_info.dart';
import 'package:the_series_db/core/constants.dart';
import 'package:the_series_db/core/errors/exceptions.dart';
import 'package:the_series_db/core/errors/failure.dart';
import 'package:the_series_db/data/datasource/serie_datasouce.dart';
import 'package:the_series_db/data/repositories/serie_repository_impl.dart';
import 'package:the_series_db/domain/entities/serie_entity.dart';

import 'serie_repository_impl_test.mocks.dart';

@GenerateMocks([SerieDataSourceImpl, NetworkInfo])
void main() {
  SerieReposotiryImplement? serieReposotiryImplement;
  MockSerieDataSourceImpl? mockSerieDataSourceImpl;
  MockNetworkInfo? mockNetworkInfo;

  setUp(() {
    mockSerieDataSourceImpl = MockSerieDataSourceImpl();
    mockNetworkInfo = MockNetworkInfo();
    serieReposotiryImplement = SerieReposotiryImplement(
      networkInfo: mockNetworkInfo!,
      serieDataSource: mockSerieDataSourceImpl!,
    );
  });

  final tSerie = SerieEntity(
    characters: <Characteres>[
      Characteres(
        apiDetailUrl: 'apiDetailUrl',
        id: 1,
        name: 'name',
        count: 'count',
      )
    ],
    episodes: <Episode>[
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

  final serieList = <SerieEntity>[];

  final tEndPoint = 'url-fake';

  test('Should check if device is online', () async {
    when(mockNetworkInfo!.isConnected).thenAnswer((_) async => true);

    when(mockSerieDataSourceImpl!.getSerieList())
        .thenAnswer((_) async => serieList);

    await serieReposotiryImplement!.getListSerie();

    verify(mockNetworkInfo!.isConnected);
  });

  group('Dev List series', () {
    setUp(() {
      when(mockNetworkInfo!.isConnected).thenAnswer((_) async => true);
    });

    test('the get data is successfuly', () async {
      when(mockSerieDataSourceImpl!.getSerieList())
          .thenAnswer((_) async => serieList);

      final result = await serieReposotiryImplement!.getListSerie();

      expect(result, Right(serieList));
    });

    test('the get data is failure', () async {
      when(mockSerieDataSourceImpl!.getSerieList()).thenThrow(ServerExeption());

      final result = await serieReposotiryImplement!.getListSerie();

      expect(result, Left(ServerFailure(message: SERVER_ERROR)));
    });
  });

  group('Dev Detail series', () {
    setUp(() {
      when(mockNetworkInfo!.isConnected).thenAnswer((_) async => true);
    });
    test('the get data datail serie is successfuly', () async {
      when(mockSerieDataSourceImpl!.getDetailSerie(endPoint: tEndPoint))
          .thenAnswer((_) async => tSerie);

      final result =
          await serieReposotiryImplement!.getDetailSerie(endPoint: tEndPoint);

      expect(result, Right(tSerie));
    });

    test('the get data datail serie is failure', () async {
      when(mockSerieDataSourceImpl!.getDetailSerie(endPoint: tEndPoint))
          .thenThrow(ServerExeption());

      final result =
          await serieReposotiryImplement!.getDetailSerie(endPoint: tEndPoint);

      expect(result, Left(ServerFailure(message: SERVER_ERROR)));
    });
  });
}
