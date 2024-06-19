import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/service/home/home_api_service.dart';

import '../../model/home/home_model.dart';
import '../../service/home/home_api.dart';

part 'home_repository.g.dart';

class HomeRepository {
  HomeApi homeApiService;

  HomeRepository(this.homeApiService);

  Future<HomeModel> getHomeProject() async {
    final result = await homeApiService.getHomeProjects();
    return result;
  }
}

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  final service = ref.watch(homeApiServiceProvider);
  return HomeRepository(service);
}
