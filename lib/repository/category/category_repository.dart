import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/service/category/category_api_service.dart';

import '../../model/category/category_model.dart';
import '../../service/category/category_api.dart';

part 'category_repository.g.dart';

class CategoryRepository {
  CategoryApi categoryApiService;

  CategoryRepository(this.categoryApiService);

  Future<CategoryModel> getProjectsByCategoryId(
    String categoryId,
  ) async {
    final result = await categoryApiService.getProjectsByCategoryId(
      categoryId,
    );
    return result;
  }

  Future<CategoryModel> getCategoryProjects(
    String categoryId,
    String typeId,
  ) async {
    final result = await categoryApiService.getProjectsByProjectType(
      categoryId,
      typeId,
    );
    return result;
  }
}

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  final service = ref.watch(categoryApiServiceProvider);
  return CategoryRepository(service);
}
