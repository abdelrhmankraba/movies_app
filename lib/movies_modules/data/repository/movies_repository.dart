import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies_modules/data/data_source/movies_remote_data_source.dart';
import 'package:movies_app/movies_modules/domain/entities/movie_detail.dart';
import 'package:movies_app/movies_modules/domain/entities/movies.dart';
import 'package:movies_app/movies_modules/domain/entities/recommendation.dart';
import 'package:movies_app/movies_modules/domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(int parameters) async{
    final result = await baseMoviesRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(int parameters) async{
    final result = await baseMoviesRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statusCode));
    }
  }
}
