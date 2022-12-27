import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/movies_modules/data/model/movie_datails_model.dart';
import 'package:movies_app/movies_modules/data/model/movies_model.dart';
import 'package:movies_app/movies_modules/data/model/recommendation_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(int parameters);

  Future<List<RecommendationModel>> getRecommendation(int parameters);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(Constants.nowPlayingMoviesPth);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
        (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(Constants.popularMoviesPth);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
        (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(Constants.topRatedMoviesPth);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
        (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int parameters) async {
    final response = await Dio().get(Constants.movieDetailsPath(parameters));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(int parameters) async{
    final response = await Dio().get(Constants.recommendationPath(parameters));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List).map(
            (e) => RecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }

  }
}
