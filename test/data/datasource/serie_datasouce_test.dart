import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_series_db/core/constants.dart';
import 'package:the_series_db/core/exceptions.dart';
import 'package:the_series_db/data/datasource/serie_datasouce.dart';
import 'package:the_series_db/data/models/serie_model.dart';

import '../../fixtures/fixture.dart';
import 'serie_datasouce_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  SerieDataSourceImpl? serieDataSourceImpl;

  MockClient? mockClient;

  setUp(() {
    mockClient = MockClient();
    serieDataSourceImpl = SerieDataSourceImpl(mockClient!);
  });

  final tSerie = SerieModel(
    aliases: 'fake-alises',
    apiDetailUrl: 'fake-api_detail_url',
    countOfEpisodes: 1,
    dateAdded: DateTime.parse('2013-09-23 14:13:53'),
    dateLastUpdated: DateTime.parse('2013-09-23 14:13:53'),
    deck: null,
    description: 'fake-description',
    firstEpisode: EpisodeModel(
      apiDetailUrl: 'fake-api_detail_url',
      id: 1,
      name: 'fake-name',
      episodeNumber: 'fake-episode',
    ),
    id: 1,
    image: ImageModel(
      iconUrl: 'fake-icon_url',
      mediumUrl: 'fake-medium_url',
      screenUrl: 'fake-screen_url',
      screenLargeUrl: 'fake-screen_large_url',
      smallUrl: 'fake-small_url',
      superUrl: 'fake-super_url',
      thumbUrl: 'fake-thumb_url',
      tinyUrl: 'fake-tiny_url',
      originalUrl: 'fake-original_url',
      imageTags: 'fake-image_tags',
    ),
    lastEpisode: EpisodeModel(
      apiDetailUrl: 'fake-api_detail_url',
      id: 32765,
      name: 'fake-name',
      episodeNumber: 'fake-episode_number',
    ),
    name: 'fake-name',
    publisher: PublisherModel(
      apiDetailUrl: 'fake-api_detail_url',
      id: 31,
      name: 'fake-name',
    ),
    siteDetailUrl: 'fake-site_detail_url',
    startYear: 'fake-start_year',
  );

  final tDetailSerie = SerieModel(
    characters: [
      CharacteresModel(
        apiDetailUrl: 'fake-api_detail_url',
        id: 1,
        name: 'fake-name',
        count: '1',
        siteDetailUrl: 'fake-site_detail_url',
      ),
      CharacteresModel(
        apiDetailUrl: 'fake-api_detail_url',
        id: 1,
        name: 'fake-name',
        count: '1',
        siteDetailUrl: 'fake-site_detail_url',
      ),
    ],
    episodes: [
      EpisodeModel(
        apiDetailUrl: 'fake-api_detail_url',
        id: 1,
        name: 'fake-name',
        siteDetailUrl: 'fake-site_detail_url',
        episodeNumber: '101',
      ),
      EpisodeModel(
        apiDetailUrl: 'fake-api_detail_url',
        siteDetailUrl: 'fake-site_detail_url',
        id: 1,
        name: 'fake-name',
        episodeNumber: '103',
      ),
    ],
    aliases: 'fake-alises',
    apiDetailUrl: 'fake-api_detail_url',
    countOfEpisodes: 1,
    dateAdded: DateTime.parse('2013-09-23 14:13:53'),
    dateLastUpdated: DateTime.parse('2013-09-23 14:13:53'),
    deck: null,
    description: 'fake-description',
    firstEpisode: EpisodeModel(
      apiDetailUrl: 'fake-api_detail_url',
      id: 1,
      name: 'fake-name',
      episodeNumber: 'fake-episode',
    ),
    id: 1,
    image: ImageModel(
      iconUrl: 'fake-icon_url',
      mediumUrl: 'fake-medium_url',
      screenUrl: 'fake-screen_url',
      screenLargeUrl: 'fake-screen_large_url',
      smallUrl: 'fake-small_url',
      superUrl: 'fake-super_url',
      thumbUrl: 'fake-thumb_url',
      tinyUrl: 'fake-tiny_url',
      originalUrl: 'fake-original_url',
      imageTags: 'fake-image_tags',
    ),
    lastEpisode: EpisodeModel(
      apiDetailUrl: 'fake-api_detail_url',
      id: 32765,
      name: 'fake-name',
      episodeNumber: 'fake-episode_number',
    ),
    name: 'fake-name',
    publisher: PublisherModel(
      apiDetailUrl: 'fake-api_detail_url',
      id: 31,
      name: 'fake-name',
    ),
    siteDetailUrl: 'fake-site_detail_url',
    startYear: 'fake-start_year',
  );

  final serieList = <SerieModel>[tSerie, tSerie];

  final tEndPoint = 'url-fake';

  group('Dev List series', () {
    test('the get data is successfuly', () async {
      var endPoint = Uri.parse(BASE_URL + SERIES_LIST_ENDPOINT + API_KEY);

      when(mockClient!.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('serie_list.json'), 200));

      await serieDataSourceImpl!.getSerieList();

      verify(
        mockClient!.get(endPoint,
            headers: <String, String>{'Accept': 'application/json'}),
      );
    });

    test('data list is successfull', () async {
      var endPoint = Uri.parse(BASE_URL + SERIES_LIST_ENDPOINT + API_KEY);

      when(mockClient!.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('serie_list.json'), 200));

      final result = await serieDataSourceImpl!.getSerieList();

      expect(result, equals(serieList));
    });

    test('data list is failure', () async {
      when(mockClient!.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('error', 401));

      final call = serieDataSourceImpl!.getSerieList;

      expect(() => call(), throwsA(TypeMatcher<ServerExeption>()));
    });
  });

  group('Dev Detail Serie', () {
    test('the conection at api to detail of the serie is successfuly',
        () async {
      var endPoint = Uri.parse(tEndPoint + API_KEY);

      when(mockClient!.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('serie_detail.json'), 200));

      await serieDataSourceImpl!.getDetailSerie(endPoint: tEndPoint);

      verify(
        mockClient!.get(endPoint,
            headers: <String, String>{'Accept': 'application/json'}),
      );
    });

    test('get data detail serie is successfull', () async {
      var endPoint = Uri.parse(tEndPoint + API_KEY);

      when(mockClient!.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('serie_detail.json'), 200));

      final result = await serieDataSourceImpl!.getDetailSerie(endPoint: tEndPoint);

      expect(result, equals(tDetailSerie));
    });

    test('get data detail serie is failure', () async {
      when(mockClient!.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('error', 401));

      final call = serieDataSourceImpl!.getDetailSerie;

      expect(() => call(endPoint: tEndPoint), throwsA(TypeMatcher<ServerExeption>()));
    });
  });
}
