import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/category/category_model.dart';

part 'category_api.g.dart';

@RestApi(baseUrl: 'http://localhost:3000/api/v1')
abstract class CategoryApi {
  factory CategoryApi(Dio dio, {String baseUrl}) = _CategoryApi;

  // 최상단
  // Path Parameters
  @GET('/category/{categoryId}')
  Future<CategoryModel> getProjectsByCategoryId(
    @Path() String? categoryId,
  );

  // ProjectType이 눌렸을 때, 호출
  // Path Parameters
  @GET('/category/{categoryId}/{projectTypeId}')
  Future<CategoryModel> getProjectsByProjectType(
    @Path() String? categoryId,
    @Path() String? projectTypeId,
  );
}
