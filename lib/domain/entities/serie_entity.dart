import 'package:equatable/equatable.dart';

class SerieEntity extends Equatable {
  SerieEntity({
    required this.aliases,
    required this.apiDetailUrl,
    this.characters,
    required this.countOfEpisodes,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.deck,
    required this.description,
    this.episodes,
    required this.firstEpisode,
    required this.id,
    required this.image,
    required this.lastEpisode,
    required this.name,
    required this.publisher,
    required this.siteDetailUrl,
    required this.startYear,
  });

  final dynamic aliases;
  final String apiDetailUrl;
  final List<Characteres>? characters;
  final int countOfEpisodes;
  final DateTime dateAdded;
  final DateTime dateLastUpdated;
  final dynamic deck;
  final String description;
  final List<Episode>? episodes;
  final Episode firstEpisode;
  final int id;
  final Image image;
  final Episode lastEpisode;
  final String name;
  final Publisher publisher;
  final String siteDetailUrl;
  final String startYear;

  @override
  List<Object?> get props => [
        aliases,
        apiDetailUrl,
        characters,
        countOfEpisodes,
        dateAdded,
        dateLastUpdated,
        deck,
        description,
        episodes,
        firstEpisode,
        id,
        image,
        lastEpisode,
        name,
        publisher,
        siteDetailUrl,
        startYear,
      ];
}

class Characteres extends Equatable {
  Characteres({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.count,
    required this.episodeNumber,
    this.siteDetailUrl,
  });

  final String apiDetailUrl;
  final int id;
  final String name;
  final String? siteDetailUrl;
  final String count;
  final String episodeNumber;

  @override
  List<Object?> get props {
    return [
      apiDetailUrl,
      id,
      name,
      siteDetailUrl,
      count,
      episodeNumber,
    ];
  }
}

class Episode extends Equatable {
  Episode({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    this.siteDetailUrl,
    required this.episodeNumber,
  });

  final String apiDetailUrl;
  final int id;
  final String name;
  final String? siteDetailUrl;
  final String episodeNumber;

  @override
  List<Object?> get props {
    return [
      apiDetailUrl,
      id,
      name,
      siteDetailUrl,
      episodeNumber,
    ];
  }
}

class Publisher extends Equatable {
  Publisher({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
  });

  final String apiDetailUrl;
  final int id;
  final String name;

  @override
  List<Object?> get props => [apiDetailUrl, id, name];
}

class Image extends Equatable {
  Image({
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
  });

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

  @override
  List<Object?> get props {
    return [
      iconUrl,
      mediumUrl,
      screenUrl,
      screenLargeUrl,
      smallUrl,
      superUrl,
      thumbUrl,
      tinyUrl,
      originalUrl,
      imageTags,
    ];
  }
}
