import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final List<int> genreIds;
  final double voteAverage;
  final String overview;
  final String releaseDate;

  const Movies({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.genreIds,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        title,
        genreIds,
        voteAverage,
        overview,
        releaseDate,
      ];
}
