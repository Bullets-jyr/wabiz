import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/repository/home/home_repository.dart';

import '../../model/home/home_model.dart';
import '../../shared/model/project_category.dart';

part 'home_view_model.freezed.dart';
part 'home_view_model.g.dart';

// Home 화면에서만 관리할 수 있는 state
@freezed
class HomeState with _$HomeState {
  factory HomeState({
    // null일 수도 있기 때문에 default값을 지정합니다.
    @Default([]) List<HomeItemModel> projects,
  }) = _HomeState;

  // projects 값을 여기서 초기화 해줘도 됩니다. ex) .init()
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  HomeRepository? homeRepository;

  // 초기화
  @override
  HomeState? build() {
    homeRepository = ref.watch(homeRepositoryProvider);
    return null;
  }

  update(List<HomeItemModel> projects) {
    state = state?.copyWith(
      projects: [...projects],
    );
  }

  Future<HomeModel?> fetchHomeData() async {
    final result = await homeRepository?.getHomeProject();
    update(result?.projects ?? []);
    return result;
  }
}

// return AsyncValue
@riverpod
Future<HomeModel> fetchHomeProject(FetchHomeProjectRef ref) async {
  try {
    // repository를 바로 읽어오는 방법
    // final result = ref.watch(homeRepositoryProvider).getHomeProject();

    final result = await ref.watch(homeViewModelProvider.notifier).fetchHomeData();
    return result ?? HomeModel();
  } catch(e) {
    return HomeModel();
  }
}

@riverpod
Future<List<ProjectCategory>> fetchHomeCategories(
    FetchHomeCategoriesRef ref) async {
  await Future.delayed(Duration(milliseconds: 2000));
  List<ProjectCategory> categories = [
    ProjectCategory(
      id: 1,
      iconPath: "assets/icons/categories/1.png",
      title: "펀딩+",
    ),
    ProjectCategory(
      id: 5,
      iconPath: "assets/icons/categories/5.png",
      title: "혜택",
    ),
    ProjectCategory(
      id: 2,
      iconPath: "assets/icons/categories/2.png",
      title: "오픈예정",
    ),
    ProjectCategory(
      id: 6,
      iconPath: "assets/icons/categories/6.png",
      title: "펀딩체험단",
    ),
    ProjectCategory(
      id: 3,
      iconPath: "assets/icons/categories/3.png",
      title: "스토어",
    ),
    ProjectCategory(
      id: 7,
      iconPath: "assets/icons/categories/7.png",
      title: "뷰티워크",
    ),
    ProjectCategory(
      id: 4,
      iconPath: "assets/icons/categories/4.png",
      title: "예약구매",
    ),
    ProjectCategory(
      id: 8,
      iconPath: "assets/icons/categories/8.png",
      title: "새학기출발",
    ),
    ProjectCategory(
      id: 5,
      iconPath: "assets/icons/categories/5.png",
      title: "혜택",
    ),
    ProjectCategory(
      id: 9,
      iconPath: "assets/icons/categories/9.png",
      title: "클래스수강",
    ),
  ];
  return categories;
}
