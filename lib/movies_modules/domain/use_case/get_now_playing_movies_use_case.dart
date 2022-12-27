import 'package:dartz/dartz.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/movies_modules/domain/entities/movies.dart';
import 'package:movies_app/movies_modules/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movies>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movies>>>  call(NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
