import 'package:freezed_annotation/freezed_annotation.dart';

part 'res_post.freezed.dart';
part 'res_post.g.dart';

@freezed
abstract class ResPosts with _$ResPosts {
  factory ResPosts({required List<ResPost> dataList}) = _ResPosts;
  factory ResPosts.fromJson(Map<String, dynamic> json) =>
      _$ResPostsFromJson(json);
}

@freezed
abstract class ResPost with _$ResPost {
  const factory ResPost({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _ResPost;

  factory ResPost.fromJson(Map<String, dynamic> json) =>
      _$ResPostFromJson(json);
}
