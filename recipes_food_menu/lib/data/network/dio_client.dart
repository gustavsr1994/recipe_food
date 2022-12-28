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
        "X-RapidAPI-Key": "ec32458918mshfa772d4af4ad7c0p13166ejsnb42d4da90324",
        "X-RapidAPI-Host":"spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
      },
    );
    Dio dio = Dio(options);

    return dio;
  }
}