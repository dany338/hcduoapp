import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/core/utils/push_notification_service.dart';
import 'package:hcduoapp/app/screens/home/home_screen.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    listenNotifications();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void listenNotifications() {
    PushNotificationService.message.listen((message) {
      Get.snackbar(
        "PushNotifications",
        "Product $message",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
      Future.delayed(const Duration(milliseconds: 2000), () {
        Get.toNamed("notification",
            arguments: PushNotificationService.messageModel);
      });
    });
    // AwesomeNotifications().actionStream.listen((event) async {
    //   Get.snackbar(
    //     "PushNotifications",
    //     "Product ${event.body}",
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.blue,
    //     colorText: Colors.white,
    //   );
    //   Future.delayed(const Duration(milliseconds: 2000), () {
    //     Get.toNamed("notification",
    //         arguments: PushNotificationService.messageModel);
    //   });
    // });
  }
}
