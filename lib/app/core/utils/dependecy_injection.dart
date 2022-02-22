import 'package:get/get.dart';
import 'package:hcduoapp/app/data/providers/auth_provider.dart';
import 'package:hcduoapp/app/data/providers/historia_provider.dart';
import 'package:hcduoapp/app/data/providers/local/auth_storage_provider.dart';
import 'package:hcduoapp/app/data/providers/user_provider.dart';
import 'package:hcduoapp/app/data/repositories/auth_repository.dart';
import 'package:hcduoapp/app/data/repositories/historia_repository.dart';
import 'package:hcduoapp/app/data/repositories/local/auth_storage_repository.dart';
import 'package:hcduoapp/app/data/repositories/user_repository.dart';

class DependencyInjection {
  static void load() {
    //Providers
    Get.put<AuthProvider>(AuthProvider());
    Get.put<UserProvider>(UserProvider());
    Get.put<HistoriaProvider>(HistoriaProvider());

    //Local
    Get.put<AuthStorageProvider>(AuthStorageProvider());

    //Repositories
    Get.put<AuthRepository>(AuthRepository());
    Get.put<UserRepository>(UserRepository());
    Get.put<HistoriaRepository>(HistoriaRepository());

    //Local
    Get.put<AuthStorageRepository>(AuthStorageRepository());
  }
}
