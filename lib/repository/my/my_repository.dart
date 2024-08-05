import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_repository.g.dart';

abstract class MyRepository {
  // 로그인이 되었을 때
  Future getProjectsByUserId(String userId);

  // 프로젝트 상태 전환
  Future updateProjectOpenState(String id);

  // 프로젝트 삭제
  Future deleteProject(String id);
}

class MyRepositoryImpl implements MyRepository {
  @override
  Future deleteProject(String id) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  Future getProjectsByUserId(String userId) {
    // TODO: implement getProjectsByUserId
    throw UnimplementedError();
  }

  @override
  Future updateProjectOpenState(String id) {
    // TODO: implement updateProjectOpenState
    throw UnimplementedError();
  }
}

@riverpod
MyRepositoryImpl myRepository(MyRepositoryRef ref) {
  return MyRepositoryImpl();
}