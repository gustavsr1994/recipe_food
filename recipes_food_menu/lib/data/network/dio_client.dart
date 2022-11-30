import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient {
  final String? apiBaseUrl;

  DioClient({@required this.apiBaseUrl});

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl!,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      headers: {
        
      },
    );
    Dio dio = Dio(options);

    return dio;
  }
}