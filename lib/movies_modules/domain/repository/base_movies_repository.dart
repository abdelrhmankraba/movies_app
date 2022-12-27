import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies_modules/domain/entities/movie_detail.dart';
import 'package:movies_app/movies_modules/domain/entities/movies.dart';
import 'package:movies_app/movies_modules/domain/entities/recommendation.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(int parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(int parameters);
}
