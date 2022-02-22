import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/data/models/message_model.dart';
import 'package:hcduoapp/app/screens/home/home_screen.dart';
import 'package:hcduoapp/app/screens/notification/notification_screen.dart';

class NotificationController extends GetxController {
  MessageModel args = MessageModel(message: '');

  @override
  void onInit() {
    args = Get.arguments as MessageModel;
    print("args: $args");
    print("args: ${args.message}");
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

  void sendNotification(String message) async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'channel_1',
        title: 'Title',
        body: message,
        bigPicture:
            'https://www.historiaclinicaduo.com/blogs/image-blog-nature.png',
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }
}
