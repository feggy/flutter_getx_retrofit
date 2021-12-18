import 'package:flutter_getx_retrofit_example/app/data/core/resource.dart';
import 'package:flutter_getx_retrofit_example/app/data/core/resource_manager.dart';
import 'package:flutter_getx_retrofit_example/app/data/core/utils.dart';
import 'package:flutter_getx_retrofit_example/app/data/payload/responses/json_place_holder/res_post.dart';
import 'package:flutter_getx_retrofit_example/app/data/repository/json_place_holder_repository.dart';
import 'package:get/get.dart';

class JsonPlaceHolderController extends GetxController {
  final JsonPlaceHolderRepository _repository = JsonPlaceHolderRepository();

  ResourceManager<List<ResPost>> resPosts = InitializeResource();

  List<ResPost>? dataList;

  _init() {
    getData();
    observe();
  }

  void getData() {
    _repository.getListPost().addObserver(resource: resPosts);
  }

  void observe() {
    resPosts.result.listen((p0) {
      if (p0.status == Status.success) {
        dataList = p0.data;
      }
    });
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
