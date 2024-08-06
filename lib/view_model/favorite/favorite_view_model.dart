import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/model/category/category_model.dart';
import 'package:wabiz/repository/favorite/favorite_repository.dart';

import '../../shared/enum/enum_shared_pref_key.dart';

part 'favorite_view_model.g.dart';

@riverpod
class FavoriteViewModel extends _$FavoriteViewModel {
  @override
  CategoryModel build() {
    String? value = ref.read(favoriteRepositoryProvider).readValue(
          EnumSharedPrefKey.favoriteProjects.value,
        );

    if (value?.isEmpty ?? true) {
      return CategoryModel(projects: []);
    }
    return CategoryModel.fromJson(jsonDecode(value ?? ''));
  }

  // 추가
  addItem(CategoryItemModel value) {
    final oldState = state.projects;
    state = state.copyWith(
      projects: [...oldState, value],
    );
    ref.read(favoriteRepositoryProvider).saveValue(
          EnumSharedPrefKey.favoriteProjects.value,
          // 문자열 형태로 값을 관리
          jsonEncode(
            state.toJson(),
          ),
        );
  }

  // 삭제
  removeItem(CategoryItemModel value) {
    final oldState = [...state.projects];
    oldState.removeWhere((element) => element.id == value.id);

    state = state.copyWith(
      projects: [...oldState],
    );
    ref.read(favoriteRepositoryProvider).saveValue(
      EnumSharedPrefKey.favoriteProjects.value,
      jsonEncode(
        state.toJson(),
      ),
    );
  }
}
