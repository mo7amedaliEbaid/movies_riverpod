import 'package:dartz/dartz.dart';

import '../../core/util/app_exception.dart';



interface class Response {
  final int statusCode;
  final String? statusMessage;
  final dynamic data;

  Response(
      {required this.statusCode,
      required this.statusMessage,
      required this.data});

  @override
  String toString() {
    return 'Response{statusCode: $statusCode, statusMessage: $statusMessage, data: $data}';
  }
}

extension ResponseExtension on Response {
  Right<AppException, Response> get toRight => Right(this);
}
