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

  addItem(CategoryItemModel value) {
    final oldState = state.projects;
    state = state.copyWith(
      projects: [...oldState, value],
    );
    ref.read(favoriteRepositoryProvider).saveValue(
          EnumSharedPrefKey.favoriteProjects.value,
          jsonEncode(
            state.toJson(),
          ),
        );
  }

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
