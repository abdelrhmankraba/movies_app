import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/tvs_modules/data/data_source/tv_remote_data_source.dart';
import 'package:movies_app/tvs_modules/domain/entities/tv.dart';
import 'package:movies_app/tvs_modules/domain/repository/base_tv_repository.dart';

class TvRepository extends BaseTvRepository {
  final BaseTvRemoteDataSource baseTvRemoteDataSource;

  TvRepository(this.baseTvRemoteDataSource);

  @override
  Future<Either<Failure, List<Tv>>> getOnTheAirTv() async {
    final result = await baseTvRemoteDataSource.getOnTheAirTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,
          failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv() async {
    final result = await baseTvRemoteDataSource.getPopularTv();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage,
          failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv() async {
    final result = await baseTvRemoteDataSource.getTopRatedTv();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage,
          failure.errorMessageModel.statusCode));
    }
  }
}
