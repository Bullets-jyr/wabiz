import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/model/project/project_model.dart';
import 'package:wabiz/service/project/project_api_service.dart';

import '../../model/project/reward_model.dart';
import '../../service/project/project_api.dart';
import '../../shared/model/response_model.dart';

part 'project_repository.g.dart';

class ProjectRepository {
  ProjectApi projectApiService;

  ProjectRepository(this.projectApiService);

  Future<ResponseModel?> createProject(ProjectItemModel body) async {
    final result = await projectApiService.createProject(body);
    return result;
  }

  Future<ResponseModel?> updateProjectOpenState(String id, ProjectItemModel body) async {
    final result = await projectApiService.updateProjectOpenState(id, body);
    return result;
  }

  Future<ResponseModel> deleteProject(String id) async {
    final result = await projectApiService.deleteProject(id);
    return result;
  }

  Future<ResponseModel> createProjectReward(String id, RewardModel body) async {
    final result = await projectApiService.createProjectReward(id, body);
    return result;
  }

  Future<ProjectModel> getProjectByUserId(String userId) async {
    final result = await projectApiService.getProjectByUserId(userId);
    return result;
  }
}

@riverpod
ProjectRepository projectRepository(ProjectRepositoryRef ref) {
  final service = ref.watch(projectApiServiceProvider);
  return ProjectRepository(service);
}