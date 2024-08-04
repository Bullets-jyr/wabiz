import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_type.freezed.dart';

part 'project_type.g.dart';

// 카테고리 페이지에서 사용하는 모델
@freezed
class ProjectType with _$ProjectType {
  const factory ProjectType({
    int? id,
    String? type,
    String? created,
    String? imagePath,
  }) = _ProjectType;

  factory ProjectType.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeFromJson(json);
}