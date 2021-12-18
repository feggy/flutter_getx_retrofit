// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_getx_retrofit_example/app/data/core/resource.dart';

class ResourceWidget<Response> extends StatelessWidget {
  Rx<Resource<Response>> data;
  Widget Function(Response? response) onSuccess;
  Widget Function() onLoading;
  Widget Function(String message) onError;
  Widget? Function()? onIdle;

  ResourceWidget({
    Key? key,
    required this.data,
    required this.onSuccess,
    required this.onLoading,
    required this.onError,
    this.onIdle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Widget widget = Container();
      switch (data.value.status) {
        case Status.success:
          widget = onSuccess(data.value.data);
          break;
        case Status.loading:
          widget = onLoading();
          break;
        case Status.error:
          widget = onError(data.value.message ?? 'Oops, terjadi kesalahan');
          break;
        case Status.idle:
          widget = onIdle != null ? onIdle!() ?? Container() : onLoading();
          break;
        default:
      }

      return widget;
    });
  }
}
