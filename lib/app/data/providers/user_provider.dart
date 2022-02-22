import 'package:dio/dio.dart';
import 'package:hcduoapp/app/core/config/app_config.dart';
import 'package:hcduoapp/app/data/models/user_model.dart';

class UserProvider {
  Future<UserModel> getUser({
    required String token,
    required String uid,
  }) async {
    final _dio = Dio();
    final _response = await _dio.get(
      "$kBaseUrl$version$kKeyInfo?uid=$uid",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    return UserModel.fromJson(_response.data);
  }
}
