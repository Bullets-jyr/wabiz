import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/model/login/login_model.dart';

import '../../service/login/login_api.dart';
import '../../service/login/login_api_service.dart';
import '../../shared/model/response_model.dart';

part 'login_repository.g.dart';

class LoginRepository {
  LoginApi loginApiService;

  LoginRepository(this.loginApiService);

  Future<ResponseModel> signUp(LoginModel body) async {
    final result = await loginApiService.signUp(body);
    return result;
  }

  Future<ResponseModel?> signIn(LoginModel body) async {
    final result = await loginApiService.signIn(body);
    if (result.response.statusCode == 204) {
      return null;
    } else {
      return ResponseModel.fromJson(result.data);
    }
  }

  Future<ResponseModel> checkEmail(LoginModel body) async {
    final result = await loginApiService.checkEmail(body);
    return result;
  }
}

@Riverpod(keepAlive: true)
LoginRepository loginRepository(LoginRepositoryRef ref) {
  final service = ref.watch(loginApiServiceProvider);
  return LoginRepository(service);
}
