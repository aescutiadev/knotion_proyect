import 'package:the_series_db/core/abstract_datasource/serie_abstract_datasource.dart';
import 'package:the_series_db/core/constants.dart';
import 'package:the_series_db/core/exceptions.dart';
import 'package:the_series_db/data/models/serie_model.dart';
import 'package:the_series_db/domain/entities/serie_entity.dart';
import 'package:http/http.dart' as http;

class SerieDataSourceImpl implements SerieDataSource {
  final http.Client client;

  SerieDataSourceImpl(this.client);
  @override
  Future<List<SerieEntity>> getSerieList() async {
    final uri = Uri.parse(BASE_URL + SERIES_LIST_ENDPOINT + API_KEY);
    final response = await client
        .get(uri, headers: <String, String>{'Accept': 'application/json'});
    if (response.statusCode == 200) {
      return serieFromJsonToList(response.body);
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<SerieEntity> getDetailSerie({required String endPoint}) async {
    final uri = Uri.parse(endPoint + API_KEY);
    final response = await client
        .get(uri, headers: <String, String>{'Accept': 'application/json'});
    if (response.statusCode == 200) {
      return serieFromJson(response.body);
    } else {
      throw ServerExeption();
    }
  }
}
