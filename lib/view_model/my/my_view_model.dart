import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/repository/my/my_repository.dart';

part 'my_view_model.freezed.dart';
part 'my_view_model.g.dart';

@freezed
class MyState with _$MyState {
  factory MyState({bool? loginState}) = _MyState;
}

@riverpod
class MyViewModel extends _$MyViewModel {
  @override
  MyState? build() {
    return MyState(
      loginState: false,
    );
  }

  fetchUserProjects() async {

  }

  updateProjects(String id) async {
    await ref.watch(myRepositoryProvider).updateProjectOpenState(id);
  }

  deleteProjects(String id) async {
    await ref.watch(myRepositoryProvider).deleteProject(id);
  }
}