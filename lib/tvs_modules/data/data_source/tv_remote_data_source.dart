import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/tvs_modules/data/model/tv_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getOnTheAirTv();

  Future<List<TvModel>> getPopularTv();

  Future<List<TvModel>> getTopRatedTv();
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvModel>> getOnTheAirTv() async {
    final response = await Dio().get(Constants.onTheAirTvPth);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data['results'] as List).map(
        (e) => TvModel.fromJson(e),
      ));
    }else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getPopularTv() async{
    final response = await Dio().get(Constants.popularTvPth);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data['results'] as List).map(
            (e) => TvModel.fromJson(e),
      ));
    }else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async{
    final response = await Dio().get(Constants.toRatedTvPth);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data['results'] as List).map(
            (e) => TvModel.fromJson(e),
      ));
    }else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
