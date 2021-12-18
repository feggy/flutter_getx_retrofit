import 'dart:developer';

import 'package:flutter_getx_retrofit_example/app/data/payload/responses/json_place_holder/res_post.dart';
import 'package:flutter_getx_retrofit_example/app/data/repository/json_place_holder_repository.dart';
import 'package:get/get.dart';

class JsonPlaceHolderController extends GetxController {
  final JsonPlaceHolderRepository _repository = JsonPlaceHolderRepository();

  List<ResPost>? dataList;

  void getList() {
    _repository.getResPostList().then((value) {
      dataList = value;
    });
  }

  @override
  void onInit() {
    getList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
