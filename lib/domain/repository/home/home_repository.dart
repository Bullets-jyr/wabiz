import 'package:wabiz/domain/entity/home/home_entity.dart';

abstract class HomeRepository{
  Future<List<HomeEntity>> getHomeProjects();
}