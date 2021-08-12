import 'dart:convert';

import 'package:the_series_db/domain/entities/serie_entity.dart';

SerieModel serieFromJson(String str) => SerieModel.fromJson(json.decode(str));

String serieToJson(SerieModel data) => json.encode(data.toJson());

List<SerieModel> serieFromJsonToList(String str) =>
    SerieModel.jsonToList(json.decode(str));

class SerieModel extends SerieEntity {
  SerieModel({
    this.characters,
    this.episodes,
    this.publisher,
    required this.aliases,
    required this.apiDetailUrl,
    required this.countOfEpisodes,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.deck,
    required this.description,
    required this.firstEpisode,
    required this.id,
    required this.image,
    required this.lastEpisode,
    required this.name,
    required this.siteDetailUrl,
    required this.startYear,
  }) : super(
          characters: characters,
          episodes: episodes,
          aliases: aliases,
          apiDetailUrl: apiDetailUrl,
          countOfEpisodes: countOfEpisodes,
          dateAdded: dateAdded,
          dateLastUpdated: dateLastUpdated,
          deck: deck,
          description: description,
          firstEpisode: firstEpisode,
          id: id,
          image: image,
          lastEpisode: lastEpisode,
          name: name,
          publisher: publisher,
          siteDetailUrl: siteDetailUrl,
          startYear: startYear,
        );

  final dynamic aliases;
  final String apiDetailUrl;
  final List<CharacteresModel>? characters;
  final int countOfEpisodes;
  final DateTime dateAdded;
  final DateTime dateLastUpdated;
  final dynamic deck;
  final String description;
  final List<EpisodeModel>? episodes;
  final EpisodeModel firstEpisode;
  final int id;
  final ImageModel image;
  final EpisodeModel lastEpisode;
  final String name;
  final PublisherModel? publisher;
  final String siteDetailUrl;
  final String startYear;

  static jsonToList(Map<String, dynamic> json) =>
      (json['results'] as List).map((i) => SerieModel.fromJson(i)).toList();

  factory SerieModel.fromJson(Map<String, dynamic> json) {
    json = (json["results"]) ?? json; // Validación de Null - safety
    return SerieModel(
      aliases: json["aliases"],
      apiDetailUrl: json["api_detail_url"],
      characters: (json["characters"] != null)
          ? List<CharacteresModel>.from(
              json["characters"].map((x) => CharacteresModel.fromJson(x)))
          : null,
      countOfEpisodes: json["count_of_episodes"],
      dateAdded: DateTime.parse(json["date_added"]),
      dateLastUpdated: DateTime.parse(json["date_last_updated"]),
      deck: json["deck"],
      description: json["description"] ?? 'no description',
      episodes: (json["episodes"] != null)
          ? List<EpisodeModel>.from(
              json["episodes"].map((x) => EpisodeModel.fromJson(x)))
          : null,
      firstEpisode: EpisodeModel.fromJson(json["first_episode"]),
      id: json["id"],
      image: ImageModel.fromJson(json["image"]),
      lastEpisode: EpisodeModel.fromJson(json["last_episode"]),
      name: json["name"],
      publisher: (json["publisher"] != null) ? PublisherModel.fromJson(json["publisher"]) : null,
      siteDetailUrl: json["site_detail_url"],
      startYear: json["start_year"],
    );
  }

  Map<String, dynamic> toJson() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "characters": List<dynamic>.from(characters!.map((x) => x.toJson())),
        "count_of_episodes": countOfEpisodes,
        "date_added": dateAdded.toIso8601String(),
        "date_last_updated": dateLastUpdated.toIso8601String(),
        "deck": deck,
        "description": description,
        "episodes": List<dynamic>.from(episodes!.map((x) => x.toJson())),
        "first_episode": firstEpisode.toJson(),
        "id": id,
        "image": image.toJson(),
        "last_episode": lastEpisode.toJson(),
        "name": name,
        "publisher": publisher!.toJson(),
        "site_detail_url": siteDetailUrl,
        "start_year": startYear,
      };
}

class CharacteresModel extends Characteres {
  CharacteresModel({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.count,
    this.siteDetailUrl,
  }) : super(
          apiDetailUrl: apiDetailUrl,
          id: id,
          name: name,
          count: count,
          siteDetailUrl: siteDetailUrl,
        );

  final String apiDetailUrl;
  final int id;
  final String name;
  final String? siteDetailUrl;
  final String count;

  factory CharacteresModel.fromJson(Map<String, dynamic> json) =>
      CharacteresModel(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
        "count": count,
      };
}

class EpisodeModel extends Episode {
  EpisodeModel({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    this.siteDetailUrl,
    required this.episodeNumber,
  }) : super(
          apiDetailUrl: apiDetailUrl,
          id: id,
          name: name,
          siteDetailUrl: siteDetailUrl,
          episodeNumber: episodeNumber,
        );

  final String apiDetailUrl;
  final int id;
  final String name;
  final String? siteDetailUrl;
  final String episodeNumber;

  Map<String, dynamic> toJson() {
    return {
      'api_detail_url': apiDetailUrl,
      'id': id,
      'name': name,
      'site_detail_url': siteDetailUrl,
      'episode_number': episodeNumber,
    };
  }

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      apiDetailUrl: json['api_detail_url'],
      id: json['id'],
      name: json['name'],
      siteDetailUrl: json['site_detail_url'],
      episodeNumber: json['episode_number'],
    );
  }
}

class PublisherModel extends Publisher {
  PublisherModel({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
  }) : super(
          apiDetailUrl: apiDetailUrl,
          id: id,
          name: name,
        );

  final String apiDetailUrl;
  final int id;
  final String name;

  Map<String, dynamic> toJson() {
    return {
      'api_detail_url': apiDetailUrl,
      'id': id,
      'name': name,
    };
  }

  factory PublisherModel.fromJson(Map<String, dynamic> json) {
    return PublisherModel(
      apiDetailUrl: json['api_detail_url'],
      id: json['id'],
      name: json['name'],
    );
  }
}

class ImageModel extends Image {
  ImageModel({
    required this.iconUrl,
    required this.mediumUrl,
    required this.screenUrl,
    required this.screenLargeUrl,
    required this.smallUrl,
    required this.superUrl,
    required this.thumbUrl,
    required this.tinyUrl,
    required this.originalUrl,
    required this.imageTags,
  }) : super(
          iconUrl: iconUrl,
          mediumUrl: mediumUrl,
          screenUrl: screenUrl,
          screenLargeUrl: screenLargeUrl,
          smallUrl: smallUrl,
          superUrl: superUrl,
          thumbUrl: thumbUrl,
          tinyUrl: tinyUrl,
          originalUrl: originalUrl,
          imageTags: imageTags,
        );

  final String iconUrl;
  final String mediumUrl;
  final String screenUrl;
  final String screenLargeUrl;
  final String smallUrl;
  final String superUrl;
  final String thumbUrl;
  final String tinyUrl;
  final String originalUrl;
  final String imageTags;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: json["image_tags"],
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTags,
      };
}
