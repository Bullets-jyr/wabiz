import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/service/category/category_api_service.dart';
import 'package:wabiz/shared/model/project_type.dart';

import '../../model/category/category_model.dart';
import '../../service/category/category_api.dart';

part 'category_repository.g.dart';

class CategoryRepository {
  CategoryApi categoryApiService;

  CategoryRepository(this.categoryApiService);

  List<ProjectType> getProjectsTypes() {
    List<ProjectType> defaultTypes = [
      ProjectType(id: 1, type: "테크·가전", imagePath: "assets/icons/type/1.svg"),
      ProjectType(id: 2, type: "패션", imagePath: "assets/icons/type/2.svg"),
      ProjectType(id: 3, type: "뷰티", imagePath: "assets/icons/type/3.svg"),
      ProjectType(id: 4, type: "홈·리빙", imagePath: "assets/icons/type/4.svg"),
      ProjectType(
          id: 5, type: "스포츠·아웃도어", imagePath: "assets/icons/type/5.svg"),
      ProjectType(id: 6, type: "푸드", imagePath: "assets/icons/type/6.svg"),
      ProjectType(id: 7, type: "도서·전자책", imagePath: "assets/icons/type/7.svg"),
      ProjectType(id: 8, type: "클래스", imagePath: "assets/icons/type/8.svg"),
    ];

    return [
      ProjectType(id: 0, type: "전체", imagePath: "assets/icons/type/all.svg"),
      ProjectType(
          id: 0, type: "BEST 펀딩", imagePath: "assets/icons/type/best.svg"),
      ...defaultTypes,
    ];
  }

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
