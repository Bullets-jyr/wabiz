import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/model/login/login_model.dart';
import 'package:wabiz/model/project/project_model.dart';
import 'package:wabiz/repository/my/my_repository.dart';
import 'package:wabiz/shared/model/response_model.dart';
import 'package:wabiz/view_model/login/login_view_model.dart';

part 'my_view_model.freezed.dart';

part 'my_view_model.g.dart';

// 상태관리
@freezed
class MyState with _$MyState {
  factory MyState({
    bool? loginState,
    LoginModel? loginModel,
  }) = _MyState;
}

// NotifierProvider
@riverpod
class MyViewModel extends _$MyViewModel {
  @override
  MyState? build() {
    // loginViewModelProvider가 변경될 때마다 build가 됩니다.
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

  Future<List<ProjectItemModel>> fetchUserProjects() async {
    final userId = state!.loginModel?.id;
    final result = await ref
        .watch(myRepositoryProvider)
        .getProjectsByUserId(userId.toString());

    return result.data;
  }

  Future<bool> updateProject(String id, ProjectItemModel body) async {
    final result = await ref.watch(myRepositoryProvider).updateProjectOpenState(id, body);
    if (result.status == "ok") {
      return true;
    }
    return false;
  }

  Future<bool> deleteProject(String id) async {
    final result = await ref.watch(myRepositoryProvider).deleteProject(id);
    if (result.status == "ok") {
      return true;
    }
    return false;
  }
}
