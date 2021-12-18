import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_getx_retrofit_example/app/data/services/json_place_holder_service.dart';

class JsonPlaceHolderDataSource {
  final Dio _dio = Dio();

  JsonPlaceHolderDataSource() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
    _dio.interceptors.addAll([JsonPlaceHolderInterceptor()]);
  }

  JsonPlaceHolderService get jsonPlaceHolder => JsonPlaceHolderService(_dio);
}

class JsonPlaceHolderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    log('${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('ERROR[${err.response?.statusCode}] MESSAGE: ${err.message} => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
