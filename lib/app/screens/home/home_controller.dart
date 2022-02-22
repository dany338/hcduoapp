import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/data/models/auth_model.dart';
import 'package:hcduoapp/app/data/models/historia_model.dart';
import 'package:hcduoapp/app/data/models/user_model.dart';
import 'package:hcduoapp/app/data/repositories/historia_repository.dart';
import 'package:hcduoapp/app/data/repositories/local/auth_storage_repository.dart';
import 'package:hcduoapp/app/data/repositories/user_repository.dart';
import 'package:hcduoapp/app/global/load_spinner.dart';
import 'package:hcduoapp/app/global/snackbar.dart';

class HomeController extends GetxController {
  //Instancias
  final _historiaRepository = Get.find<HistoriaRepository>();
  final _userRepository = Get.find<UserRepository>();
  final _authStorageRepository = Get.find<AuthStorageRepository>();

  AuthModel authModel = AuthModel();

  //Variables
  RxInt isSelectedIndex = RxInt(0);
  RxString name = RxString('');
  RxString location = RxString('');
  RxList<HistoriaModel> historias = RxList<HistoriaModel>([]);
  UserModel user = UserModel(
    name: '',
    uid: 0,
    location: '',
    username: '',
    picture: '',
    email: '',
    password: '',
  );

  @override
  void onInit() {
    _loadSession();
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

  selectedIndex(int index) {
    isSelectedIndex.value = index;
  }

  _loadSession() async {
    try {
      authModel = await _authStorageRepository.getSession(key: "auth");
      await _loadInformation();
      await _loadHistorias();
    } catch (e) {
      Snackbar.show(
        title: "Error Auth",
        message: e.toString(),
      );
    }
  }

  _loadHistorias() async {
    try {
      historias.value = await _historiaRepository.getHistorias(
        token: "${authModel.accessToken}",
        query: "",
        page: 0,
        limit: 10,
      );
    } on DioError catch (e) {
      LoadSpinner.hide();
      Snackbar.show(
        title: "Error cargando las historias",
        message: e.response?.data['name'],
        type: 1,
      );
    }
  }

  _loadInformation() async {
    try {
      user = await _userRepository.getUser(
        token: "${authModel.accessToken}",
        uid: "${authModel.uid}",
      );
      name.value = user.name.toString();
      location.value = user.location.toString();
      print("_loadInformation: ${user.name}");
    } on DioError catch (e) {
      LoadSpinner.hide();
      Snackbar.show(
        title: "Error cargando información del usuario",
        message: e.response?.data['name'],
        type: 1,
      );
    }
  }
}
