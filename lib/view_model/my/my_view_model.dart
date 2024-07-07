import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/model/login/login_model.dart';
import 'package:wabiz/repository/my/my_repository.dart';
import 'package:wabiz/view_model/login/login_view_model.dart';

part 'my_view_model.freezed.dart';

part 'my_view_model.g.dart';

@freezed
class MyState with _$MyState {
  factory MyState({
    bool? loginState,
    LoginModel? loginModel,
  }) = _MyState;
}

@riverpod
class MyViewModel extends _$MyViewModel {
  @override
  MyState? build() {
    final status = ref.watch(loginViewModelProvider);
    return MyState(
      loginState: status.isLogin,
      loginModel: LoginModel(
        email: status.email,
        username: status.username,
        id: status.userId,
      ),
    );
  }

  fetchUserProjects() async {}

  updateProjects(String id) async {
    await ref.watch(myRepositoryProvider).updateProjectOpenState(id);
  }

  deleteProjects(String id) async {
    await ref.watch(myRepositoryProvider).deleteProject(id);
  }
}
