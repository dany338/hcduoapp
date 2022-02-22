import 'package:get/get.dart';
import 'package:hcduoapp/app/screens/detail/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}
