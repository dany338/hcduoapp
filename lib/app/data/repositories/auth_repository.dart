import 'package:get/get.dart';
import 'package:hcduoapp/app/data/models/auth_model.dart';
import 'package:hcduoapp/app/data/providers/auth_provider.dart';

class AuthRepository {
  final _apiProvider = Get.find<AuthProvider>();

  Future<AuthModel> auth({
    required String login,
    required String password,
  }) =>
      _apiProvider.auth(login: login, password: password);
}
