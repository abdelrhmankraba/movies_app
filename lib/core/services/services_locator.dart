import 'package:get_it/get_it.dart';
import 'package:movies_app/movies_modules/data/data_source/movies_remote_data_source.dart';
import 'package:movies_app/movies_modules/data/repository/movies_repository.dart';
import 'package:movies_app/movies_modules/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies_modules/domain/use_case/get_movie_detail_use_case.dart';
import 'package:movies_app/movies_modules/domain/use_case/get_now_playing_movies_use_case.dart';
import 'package:movies_app/movies_modules/domain/use_case/get_popular_movies_use_case.dart';
import 'package:movies_app/movies_modules/domain/use_case/get_recommendation_use_case.dart';
import 'package:movies_app/movies_modules/domain/use_case/get_top_rated_movies_use_case.dart';
import 'package:movies_app/movies_modules/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/movies_modules/presentation/controller/movies_bloc.dart';
import 'package:movies_app/tvs_modules/data/data_source/tv_remote_data_source.dart';
import 'package:movies_app/tvs_modules/data/repository/tv_repository.dart';
import 'package:movies_app/tvs_modules/domain/repository/base_tv_repository.dart';
import 'package:movies_app/tvs_modules/domain/use_case/get_on_the_air_use_case.dart';
import 'package:movies_app/tvs_modules/domain/use_case/get_popular_tv_use_case.dart';
import 'package:movies_app/tvs_modules/domain/use_case/get_to_rated_tv_use_case.dart';
import 'package:movies_app/tvs_modules/presentation/controller/tv_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    sl.registerFactory(() => TvBloc(sl(), sl(), sl()));

    ///use cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    sl.registerLazySingleton(() => GetOnTheAirTvUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTvUseCase(sl()));
    sl.registerLazySingleton(() => GetToRatedTvUseCase(sl()));

    ///repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));

    ///data source
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());

    sl.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());
  }
}
