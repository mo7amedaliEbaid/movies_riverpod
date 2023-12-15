import 'package:dartz/dartz.dart';
import 'package:movies_riverpod/features/movie_detail/data/datasource/remote/movie_detail_remote_datasource.dart';
import 'package:movies_riverpod/models/movie_details/movie_detail.dart';
import 'package:movies_riverpod/models/response/casts_response.dart';

import '../../../../../core/network/network_service.dart';
import '../../../../../core/network/network_values.dart';
import '../../../../../core/util/app_exception.dart';




interface class MovieDetailRemoteDataSourceImpl extends MovieDetailRemoteDataSource {
  final NetworkService networkService;

  MovieDetailRemoteDataSourceImpl({required this.networkService});

  @override
  Future<Either<AppException, MovieDetail>> getMovie(
      {required int id}) async {
    final response =
        await networkService.get(EndPoints.movie(id));
    return response.fold((l) => Left(l), (r) {
      final jsonData = r.data;
      if (jsonData == null) {
        return Left(AppException(
          identifier: EndPoints.movie(id),
          message: 'The data is not in the valid format',
          statusCode: 0,
          which: 'http',
        ));
      } else {
        return Right(MovieDetail.fromJson(jsonData));
      }
    });
  }

  @override
  Future<Either<AppException, CastsResponse>> getCasts(
      {required int id}) async {
    final response =
        await networkService.get(EndPoints.casts(id));
    return response.fold((l) => Left(l), (r) {
      final jsonData = r.data;
      if (jsonData == null) {
        return Left(AppException(
            identifier: EndPoints.casts(id),
            statusCode: 0,
            message: 'The data is not in valid for',
            which: 'http'));
      } else {
        final castsResponse = CastsResponse(jsonData['cast'] ?? []);
        return Right(castsResponse);
      }
    });
  }
}
