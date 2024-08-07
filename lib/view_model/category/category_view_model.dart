import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/repository/category/category_repository.dart';
import 'package:wabiz/shared/model/project_type.dart';

import '../../model/category/category_model.dart';

part 'category_view_model.freezed.dart';

part 'category_view_model.g.dart';

enum EnumCategoryProjectType {
  recommend('추천순'),
  lowFunded('낮은 펀딩금액순'),
  highFunded('높은 펀딩금액순');

  final String value;

  const EnumCategoryProjectType(this.value);
}

@freezed
class CategoryState with _$CategoryState {
  factory CategoryState({
    // 밑줄에 대한 UI처리를 위해서...
    ProjectType? selectedType,
    @Default(EnumCategoryProjectType.recommend)
    EnumCategoryProjectType? projectFilter,
    // for 데이터 캐싱
    @Default([]) List<CategoryItemModel> projects,
    // 받는 값을 AsyncValue로 관리하기 위해서...
    @Default(AsyncValue.loading())
    AsyncValue<List<CategoryItemModel>> projectState,
  }) = _CategoryState;

// factory CategoryState.init();
}

@riverpod
class CategoryViewModel extends _$CategoryViewModel {
  @override
  CategoryState build() {
    return CategoryState(
      selectedType: const ProjectType(id: 0, type: '전체'),
      projectFilter: EnumCategoryProjectType.recommend,
      projects: [],
    );
  }

  // update project type
  updateType(ProjectType type) {
    state = state.copyWith(
      selectedType: type,
      // 초기화?!
      projectFilter: EnumCategoryProjectType.recommend,
    );
  }

  // 서버에 요청하지 않고 데이터 캐싱된 걸 가지고 해봅시다.
  updateProjectFilter(EnumCategoryProjectType filter) {
    state = state.copyWith(
      projectState: const AsyncValue.loading(),
      projectFilter: filter,
    );

    // 캐싱된 값을 가져옵니다.
    final _projects = [...state.projects];

    if (filter == EnumCategoryProjectType.lowFunded) {
      _projects.sort((a, b) {
        if ((a.totalFunded ?? 0) > (b.totalFunded ?? 0)) {
          return 1;
        } else {
          return -1;
        }
      });
    } else if (filter == EnumCategoryProjectType.highFunded) {
      _projects.sort((a, b) {
        if ((a.totalFunded ?? 0) > (b.totalFunded ?? 0)) {
          return -1;
        } else {
          return 1;
        }
      });
    }

    state = state.copyWith(
      projectState: AsyncValue.data(_projects),
      projectFilter: filter,
    );
  }

  fetchProjects(String categoryId) async {
    state = state.copyWith(
      projectState: const AsyncValue.loading(),
    );
    String typeId = '${state.selectedType?.id}';
    if (state.selectedType?.id == 0) {
      if (state.selectedType?.type == '전체') {
        typeId = 'all';
      } else {
        typeId = 'best';
      }
    }
    final AsyncValue<List<CategoryItemModel>> _state =
        await AsyncValue.guard(() async {
      final response = await ref
          .watch(categoryRepositoryProvider)
          .getCategoryProjects(categoryId, typeId);
      return response.projects;
    });

    state = state.copyWith(
      projectState: _state,
      projects: _state.value ?? [],
    );
  }
}

// Functional 방식
@riverpod
Future<List<ProjectType>> fetchTypeTabs(FetchTypeTabsRef ref) async {
  await Future.delayed(
    const Duration(milliseconds: 500),
  );
  // return [
  //   ProjectType(id: 0, type: '전체', imagePath: 'assets/icons/type/all.svg'),
  //   ProjectType(id: 0, type: 'BEST 펀딩', imagePath: 'assets/icons/type/best.svg'),
  //
  //   ProjectType(id: 1, type: '테크가전', imagePath: 'assets/icons/type/1.svg'),
  //   ProjectType(id: 2, type: '패션', imagePath: 'assets/icons/type/2.svg'),
  //   ProjectType(id: 3, type: '뷰티', imagePath: 'assets/icons/type/3.svg'),
  //   ProjectType(id: 4, type: '홈리빙', imagePath: 'assets/icons/type/4.svg'),
  //   ProjectType(id: 5, type: '스포츠아웃도어', imagePath: 'assets/icons/type/5.svg'),
  //   ProjectType(id: 6, type: '푸드', imagePath: 'assets/icons/type/6.svg'),
  //   ProjectType(id: 7, type: '도서전자책', imagePath: 'assets/icons/type/7.svg'),
  //   ProjectType(id: 8, type: '클래스', imagePath: 'assets/icons/type/8.svg'),
  // ];
  return ref.read(categoryRepositoryProvider).getProjectsTypes();
}

// Functional 방식
@riverpod
Future<CategoryModel> fetchCategoryProjects(
  FetchCategoryProjectsRef ref,
  String categoryId,
) async {
  final response = await ref
      .watch(categoryRepositoryProvider)
      .getProjectsByCategoryId(categoryId);
  return response;
}

// Functional 방식
@riverpod
Future<CategoryModel> fetchCategoryProjectsByType(
  FetchCategoryProjectsByTypeRef ref,
  String categoryId,
) async {
  final vm = ref.watch(categoryViewModelProvider);

  String typeId = '${vm.selectedType?.id}';
  if (vm.selectedType?.id == 0) {
    if (vm.selectedType?.type == '전체') {
      typeId = 'all';
    } else {
      typeId = 'best';
    }
  }
  final response = await ref
      .watch(categoryRepositoryProvider)
      .getCategoryProjects(categoryId, typeId);

  return response;
}
