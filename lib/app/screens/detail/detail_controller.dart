import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/data/models/auth_model.dart';
import 'package:hcduoapp/app/data/models/historia_model.dart';
import 'package:hcduoapp/app/data/repositories/local/auth_storage_repository.dart';
import 'package:hcduoapp/app/global/load_spinner.dart';
import 'package:hcduoapp/app/global/snackbar.dart';

class DetailController extends GetxController {
  //Instancias
  // final _reservationRepository = Get.find<ReservationRepository>();
  final _authStorageRepository = Get.find<AuthStorageRepository>();
  HistoriaModel historia = HistoriaModel();
  AuthModel authModel = AuthModel();
  //Variables
  String _date = "";

  //funciones
  void onChangeDate(String value) => _date = value;

  @override
  void onInit() {
    _loadSession();
    historia = Get.arguments as HistoriaModel;
    print("Historia: ${historia.toJson()}");
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

  _loadSession() async {
    try {
      authModel = await _authStorageRepository.getSession(key: "auth");
    } on DioError catch (e) {
      Snackbar.show(
        title: "Error Session",
        message: e.toString(),
      );
    }
  }

  void save() {
    LoadSpinner.show();
    try {
      String _response = "";
      // ReservationModel reservation = ReservationModel(
      //   idUser: authModel.idUser,
      //   idHouse: house.idHouse,
      //   date: _date,
      //   price: house.price,
      // );

      // _response = await _reservationRepository.insert(
      //   token: "${authModel.requestToken}",
      //   reservation: reservation,
      // );
      LoadSpinner.hide();
      Snackbar.show(
        title: "Felicitaciones",
        message: _response,
      );
    } on DioError catch (e) {
      LoadSpinner.hide();
      Snackbar.show(
        title: "Error Reservation",
        message: e.toString(),
        type: 1,
      );
    }
  }
}
