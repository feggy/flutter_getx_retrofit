import 'package:flutter_getx_retrofit_example/app/data/payload/responses/json_place_holder/res_post.dart';
import 'package:flutter_getx_retrofit_example/app/data/provider/data_sources.dart';
import 'package:flutter_getx_retrofit_example/app/data/services/json_place_holder_service.dart';

class JsonPlaceHolderRepository {
  final JsonPlaceHolderService _jsonPlaceHolderService =
      JsonPlaceHolderDataSource().jsonPlaceHolder;

  Future<List<ResPost>> getResPostList() async {
    var result = await _jsonPlaceHolderService.jsonPost();
    return result;
  }
}
