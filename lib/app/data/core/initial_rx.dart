import 'package:flutter_getx_retrofit_example/app/data/core/resource.dart';
import 'package:get/get.dart';

class InitialRx<Response> {
  Rx<Resource<Response>> create() {
    return Rx<Resource<Response>>(Resource.idle(null));
  }
}
