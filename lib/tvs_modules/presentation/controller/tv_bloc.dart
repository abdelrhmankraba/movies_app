// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/tvs_modules/domain/entities/tv.dart';
import 'package:movies_app/tvs_modules/domain/use_case/get_on_the_air_use_case.dart';
import 'package:movies_app/tvs_modules/domain/use_case/get_popular_tv_use_case.dart';
import 'package:movies_app/tvs_modules/domain/use_case/get_to_rated_tv_use_case.dart';

part 'tv_event.dart';

part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetOnTheAirTvUseCase getOnTheAirTv;
  final GetPopularTvUseCase getPopularTv;
  final GetToRatedTvUseCase getTopRatedTv;

  TvBloc(this.getOnTheAirTv, this.getPopularTv, this.getTopRatedTv)
      : super(const TvState()) {
    on<GetOnTheAirTvEvent>(_getOnTheAirTv);
    on<GetPopularTvEvent>(_getPopularTv);
    on<GetTopRatedTvEvent>(_getTopRatedTv);
  }

  FutureOr<void> _getOnTheAirTv(
      GetOnTheAirTvEvent event, Emitter<TvState> emit) async {
    final result = await getOnTheAirTv(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              onTheAirState: RequestState.error,
              onTheAirMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              onTheAirState: RequestState.loaded,
              onTheAirTv: r,
            )));
  }

  FutureOr<void> _getPopularTv(
      GetPopularTvEvent event, Emitter<TvState> emit) async {
    final result = await getPopularTv(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              popularState: RequestState.loaded,
              popularTv: r,
            )));
  }

  FutureOr<void> _getTopRatedTv(
      GetTopRatedTvEvent event, Emitter<TvState> emit) async {
    final result = await getTopRatedTv(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              topRatedState: RequestState.loaded,
              topRatedTv: r,
            )));
  }
}
