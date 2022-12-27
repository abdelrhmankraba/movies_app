import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/movies_modules/domain/entities/recommendation.dart';
import 'package:movies_app/movies_modules/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation> , int>{
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(int parameters) async{
    return await baseMoviesRepository.getRecommendation(parameters);

  }

}