import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies_modules/domain/use_case/get_now_playing_movies_use_case.dart';
import 'package:movies_app/movies_modules/domain/use_case/get_popular_movies_use_case.dart';
import 'package:movies_app/movies_modules/domain/use_case/get_top_rated_movies_use_case.dart';
import 'package:movies_app/movies_modules/presentation/controller/movies_events.dart';
import 'package:movies_app/movies_modules/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMovies;
  final GetPopularMoviesUseCase getPopularMovies;
  final GetTopRatedMoviesUseCase getTopRatedMovies;

  MoviesBloc(
      this.getNowPlayingMovies, this.getPopularMovies, this.getTopRatedMovies)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMovies(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              nowPlayingState: RequestState.loaded,
              nowPlayingMovies: r,
            )));
  }
  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMovies(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: r,
        )));
  }
  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMovies(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          topRatedState: RequestState.loaded,
          topRatedMovies: r,
        )));
  }
}
