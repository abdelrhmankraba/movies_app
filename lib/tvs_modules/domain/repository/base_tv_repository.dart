import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/tvs_modules/domain/entities/tv.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<Tv>>> getOnTheAirTv();

  Future<Either<Failure, List<Tv>>> getPopularTv();

  Future<Either<Failure, List<Tv>>> getTopRatedTv();
}
