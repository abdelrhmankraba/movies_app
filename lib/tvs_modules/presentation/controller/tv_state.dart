part of 'tv_bloc.dart';

class TvState extends Equatable {
  final List<Tv> onTheAirTv;
  final RequestState onTheAirState;
  final String onTheAirMessage;
  final List<Tv> popularTv;
  final RequestState popularState;
  final String popularMessage;
  final List<Tv> topRatedTv;
  final RequestState topRatedState;
  final String topRatedMessage;

  const TvState({
    this.onTheAirTv = const [],
    this.onTheAirState = RequestState.loading,
    this.onTheAirMessage = '',
    this.popularTv = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedTv = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  TvState copyWith({
    List<Tv>? onTheAirTv,
    RequestState? onTheAirState,
    String? onTheAirMessage,
    List<Tv>? popularTv,
    RequestState? popularState,
    String? popularMessage,
    List<Tv>? topRatedTv,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return TvState(
      onTheAirTv: onTheAirTv ?? this.onTheAirTv,
      onTheAirState: onTheAirState ?? this.onTheAirState,
      onTheAirMessage: onTheAirMessage ?? this.onTheAirMessage,
      popularTv: popularTv ?? this.popularTv,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedTv: topRatedTv ?? this.topRatedTv,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        onTheAirTv,
        onTheAirState,
        onTheAirMessage,
        popularTv,
        popularState,
        popularMessage,
        topRatedTv,
        topRatedState,
        topRatedMessage
      ];
}
