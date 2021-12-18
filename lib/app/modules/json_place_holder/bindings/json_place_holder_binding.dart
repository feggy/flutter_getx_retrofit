import 'package:get/get.dart';

import '../controllers/json_place_holder_controller.dart';

class JsonPlaceHolderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JsonPlaceHolderController>(
      () => JsonPlaceHolderController(),
    );
  }
}
