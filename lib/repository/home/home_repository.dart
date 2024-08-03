import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/service/home/home_api_service.dart';

import '../../model/home/home_model.dart';
import '../../service/home/home_api.dart';

part 'home_repository.g.dart';

// abstract class HomeRepository {
//   Future<HomeModel> getHomeProject();
// }

// class HomeRepositoryImpl extends HomeRepository {
class HomeRepository {
  HomeApi homeApiService;

  // HomeRepositoryImpl(this.homeApiService);
  HomeRepository(this.homeApiService);

  // @override
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
