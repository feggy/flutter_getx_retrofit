import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_getx_retrofit_example/app/data/core/initial_rx.dart';
import 'package:flutter_getx_retrofit_example/app/data/core/resource.dart';
import 'package:get/get.dart';

abstract class ResourceManager<ResultType> {
  void call();

  Rx<Resource<ResultType>> result =
      Rx<Resource<ResultType>>(Resource.idle(null));
}

class InitializeResource<T> implements ResourceManager<T> {
  InitializeResource() {
    result = InitialRx<T>().create();
  }

  @override
  late Rx<Resource<T>> result;

  @override
  void call() {
    log('init resource');
  }
}

class NetworkOnlyResource<ResultType, RequestType>
    implements ResourceManager<ResultType> {
  /* NOTE  
  Future<BaseResponse<RequestType>> Function() createCall; 
  >>> Jika memiliki response pattern <<<
  */
  Future<RequestType> Function() createCall;
  Future<ResultType>? Function(RequestType? item) handleCallResult;
  bool isDirectCall = false;

  NetworkOnlyResource({
    this.isDirectCall = false,
    required this.createCall,
    required this.handleCallResult,
  }) {
    result.value = Resource.idle(null);
    if (isDirectCall) {
      call();
    }
  }

  RequestType? processResponse(RequestType? data) => data;

  void _call() {
    result.value = Resource.loading(null);
    var apiResponse = createCall.call();
    apiResponse.then((value) {
      if (value != null) {
        var temp = handleCallResult(processResponse(value));

        temp?.then((response) {
          result.value = Resource.success(response);
        });
      } else {
        result.value = Resource.error('Terjadi kesalahan');
      }
    }).catchError((onError) {
      var error = onError as DioError;
      var errorMsg = '';
      if (error.type == DioErrorType.connectTimeout) {
        errorMsg = 'Request time out';
      } else {
        errorMsg = 'Terjadi kesalahan pada aplikasi';
      }
      result.value = Resource.error(errorMsg);
    });
  }

  @override
  Rx<Resource<ResultType>> result =
      Rx<Resource<ResultType>>(Resource.idle(null));

  @override
  void call() {
    _call();
  }
}
