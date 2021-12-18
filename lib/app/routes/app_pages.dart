import 'package:get/get.dart';

import 'package:flutter_getx_retrofit_example/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_getx_retrofit_example/app/modules/home/views/home_view.dart';
import 'package:flutter_getx_retrofit_example/app/modules/json_place_holder/bindings/json_place_holder_binding.dart';
import 'package:flutter_getx_retrofit_example/app/modules/json_place_holder/views/json_place_holder_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.JSON_PLACE_HOLDER,
      page: () => JsonPlaceHolderView(),
      binding: JsonPlaceHolderBinding(),
    ),
  ];
}
