import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final int id;
  final String backdropPath;
  final String name;
  final List<int> genreIds;
  final double voteAverage;
  final String overview;
  final String firstAirDate;

  const Tv(
      {required this.id,
      required this.backdropPath,
      required this.name,
      required this.genreIds,
      required this.voteAverage,
      required this.overview,
      required this.firstAirDate});

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        name,
        genreIds,
        voteAverage,
        overview,
        firstAirDate,
      ];
}
