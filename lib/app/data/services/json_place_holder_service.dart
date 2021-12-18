import 'package:dio/dio.dart';
import 'package:flutter_getx_retrofit_example/app/data/payload/responses/json_place_holder/res_post.dart';
import 'package:retrofit/http.dart';

part 'json_place_holder_service.g.dart';

@RestApi()
abstract class JsonPlaceHolderService {
  factory JsonPlaceHolderService(Dio dio) = _JsonPlaceHolderService;

  @GET('/posts')
  Future<List<ResPost>> jsonPost();
}
