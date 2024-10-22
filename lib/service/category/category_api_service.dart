import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/shared/network_provider.dart';

import 'category_api.dart';

part 'category_api_service.g.dart';

@riverpod
CategoryApi categoryApiService(CategoryApiServiceRef ref) {
  final dio = ref.watch(dioProvider);
  var localhost = 'localhost';

  if (defaultTargetPlatform == TargetPlatform.android) {
    // localhost = '10.0.2.2';
    // localhost = '192.168.0.105';
    localhost = '10.220.190.38';
    // localhost = '10.220.180.151';
  }

  return CategoryApi(
    dio,
    baseUrl: 'http://$localhost:3000/api/v1',
  );
}