import 'package:dio/dio.dart';
import 'package:hcduoapp/app/core/config/app_config.dart';
import 'package:hcduoapp/app/data/models/auth_model.dart';

class AuthProvider {
  Future<AuthModel> auth({
    required String login,
    required String password,
  }) async {
    final _dio = Dio();
    final _response = await _dio.post(
      "$kBaseUrl$version$kKeyAuth",
      data: {
        "login": login,
        "password": password,
      },
    );
    return AuthModel.fromJson(_response.data['data']);
  }
}
