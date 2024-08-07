import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/data/data_source/remote/home/home_api.dart';
import 'package:wabiz/data/data_source/remote/home/home_api_service.dart';
import 'package:wabiz/domain/entity/home/home_entity.dart';
import 'package:wabiz/domain/repository/home/home_repository.dart';

part 'home_repository_impl.g.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeApi homeApiService;

  HomeRepositoryImpl(this.homeApiService);

  @override
  Future<List<HomeEntity>> getHomeProjects() async {
    final result = await homeApiService.getHomeProjects();
    return result.projects.map((e) => HomeEntity.fromModel(e)).toList();
  }
}

@riverpod
HomeRepositoryImpl homeRepository(HomeRepositoryRef ref) {
  final service = ref.watch(homeApiServiceProvider);
  return HomeRepositoryImpl(service);
}