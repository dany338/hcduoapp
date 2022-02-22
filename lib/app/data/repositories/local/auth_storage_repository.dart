import 'package:get/get.dart';
import 'package:hcduoapp/app/data/models/auth_model.dart';
import 'package:hcduoapp/app/data/providers/local/auth_storage_provider.dart';

class AuthStorageRepository {
  final _authStorage = Get.find<AuthStorageProvider>();

  Future<void> setSession({
    required String key,
    required AuthModel authModel,
  }) =>
      _authStorage.setSession(
        key: key,
        authModel: authModel,
      );

  Future<AuthModel> getSession({
    required String key,
  }) =>
      _authStorage.getSession(key: key);
}
