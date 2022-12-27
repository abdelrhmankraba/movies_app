import 'package:movies_app/tvs_modules/domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel(
      {required super.id,
      required super.backdropPath,
      required super.name,
      required super.genreIds,
      required super.voteAverage,
      required super.overview,
      required super.firstAirDate});

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        name: json['name'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        voteAverage: json['vote_average'].toDouble(),
        overview: json['overview'],
        firstAirDate: json['first_air_date'],
      );
}
