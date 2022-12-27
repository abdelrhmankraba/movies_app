import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/movies_modules/domain/entities/movie_detail.dart';
import 'package:movies_app/movies_modules/domain/repository/base_movies_repository.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetail,int> {
  BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(int parameters) async{
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}
