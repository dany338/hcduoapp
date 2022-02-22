import 'package:get/get.dart';
import 'package:hcduoapp/app/data/models/user_model.dart';
import 'package:hcduoapp/app/data/providers/user_provider.dart';

class UserRepository {
  final _apiProvider = Get.find<UserProvider>();

  Future<UserModel> getUser({
    required String token,
    required String uid,
  }) =>
      _apiProvider.getUser(token: token, uid: uid);
}
