import 'package:movies_app/movies_modules/domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.genreIds,
    required super.voteAverage,
    required super.overview,
    required super.releaseDate,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        title: json['title'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        voteAverage: json['vote_average'].toDouble(),
        overview: json['overview'],
        releaseDate: json['release_date'],
      );
}
