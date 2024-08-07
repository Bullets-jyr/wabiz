import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/model/project/project_model.dart';
import 'package:wabiz/service/project/project_api.dart';
import 'package:wabiz/service/project/project_api_service.dart';
import 'package:wabiz/shared/model/response_model.dart';

part 'my_repository.g.dart';

abstract class MyRepository {
  // 로그인이 되었을 때
  Future getProjectsByUserId(String userId);

  // 프로젝트 상태 전환
  Future updateProjectOpenState(String id, ProjectItemModel body);

  // 프로젝트 삭제
  Future deleteProject(String id);
}

class MyRepositoryImpl implements MyRepository {
  ProjectApi projectApiService;

  MyRepositoryImpl(this.projectApiService);

  @override
  Future<ResponseModel> deleteProject(String id) async {
    // TODO: implement deleteProject
    // throw UnimplementedError();
    final result = await projectApiService.deleteProject(id);
    return result;
  }

  @override
  Future<ProjectModel> getProjectsByUserId(String userId) async {
    // TODO: implement getProjectsByUserId
    // throw UnimplementedError();
    final result = await projectApiService.getProjectByUserId(userId);
    return result;
  }

  @override
  Future<ResponseModel> updateProjectOpenState(String id, ProjectItemModel body) async {
    // TODO: implement updateProjectOpenState
    // throw UnimplementedError();
    final result = await projectApiService.updateProjectOpenState(id, body);
    return result;
  }
}

@riverpod
MyRepositoryImpl myRepository(MyRepositoryRef ref) {
  final projectApiService = ref.watch(projectApiServiceProvider);
  return MyRepositoryImpl(projectApiService);
}