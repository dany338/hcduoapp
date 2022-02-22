import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/core/utils/validator.dart';
import 'package:hcduoapp/app/data/models/auth_model.dart';
import 'package:hcduoapp/app/data/repositories/auth_repository.dart';
import 'package:hcduoapp/app/data/repositories/local/auth_storage_repository.dart';
import 'package:hcduoapp/app/global/load_spinner.dart';
import 'package:hcduoapp/app/global/snackbar.dart';
import 'package:hcduoapp/app/routes/app_routes.dart';

class LoginController extends GetxController {
  //Instancias
  final _authRepository = Get.find<AuthRepository>();
  final _authStorageRepository = Get.find<AuthStorageRepository>();

  AuthModel _authModel = AuthModel();

  //Variables
  String _login = "dany338@gmail.com";
  String _password = "xxxxxxx";

  //funciones
  void onChangeEmail(String value) => _login = Validator.validateEmail(value);
  void onChangePassword(String value) => _password = value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  doAuth() async {
    LoadSpinner.show();
    try {
      _authModel = await _authRepository.auth(
        login: _login,
        password: _password,
      );

      print("_authModel.uid: ${_authModel.uid}");

      //Persistir datos en STORAGE
      await _authStorageRepository.setSession(
        key: "auth",
        authModel: _authModel,
      );

      LoadSpinner.hide();
      if (_authModel.message == true) {
        Get.offNamed(AppRoutes.HOME);
      }
    } on DioError catch (e) {
      LoadSpinner.hide();
      Snackbar.show(
        title: "Error autenticandose",
        message: e.response?.data['name'],
        type: 1,
      );
    }
  }
}
