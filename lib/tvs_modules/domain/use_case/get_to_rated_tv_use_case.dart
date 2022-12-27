import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/tvs_modules/domain/entities/tv.dart';
import 'package:movies_app/tvs_modules/domain/repository/base_tv_repository.dart';

class GetToRatedTvUseCase extends BaseUseCase<List<Tv>, NoParameters> {
  final BaseTvRepository baseTvRepository;

  GetToRatedTvUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async {
    return await baseTvRepository.getTopRatedTv();
  }
}
