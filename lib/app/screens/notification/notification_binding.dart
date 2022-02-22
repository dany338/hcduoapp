import 'package:get/get.dart';
import 'package:hcduoapp/app/screens/notification/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
