
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_riverpod/models/response/response.dart' as response;
import 'package:movies_riverpod/core/network/network_service.dart';
import '../app/app_globals.dart';
import '../util/app_exception.dart';
import 'exception/mixin/network_handler_mixin.dart';
import 'network_values.dart';

interface class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  late Dio dio;

  DioNetworkService() {
    dio = Dio();
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20));

  @override
  String get baseUrl => "https://api.themoviedb.org/3/" ;

  @override
  String get apiKey => "15cc2d06189e5b776834afe0bdef40ba";

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeaders(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = headers;
    }
    return header;
  }

  @override
  Future<Either<AppException, response.Response>> get(String endPoint, {Map<String, dynamic>? queryParams}) {
    queryParams ??= {};
    queryParams[Parameters.apiKey]=apiKey;
    final res = handleException(
      () => dio.get(
        endPoint,
        queryParameters: queryParams,
      ),
      endPoint: endPoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> post(String endPoint,
      {Map<String, dynamic>? data}) {
    // queryParams[Params.apiKey] = apiKey;
    final res = handleException(
        () => dio.post(
              endPoint,
              data: data,
            ),
        endPoint: endPoint);
    return res;
  }
}
