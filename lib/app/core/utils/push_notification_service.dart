import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/data/models/message_model.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String token = "";
  static final StreamController<String> _messageStream =
      StreamController.broadcast();
  static Stream<String> get messageStream => _messageStream.stream;

  static MessageModel messageModel = MessageModel(message: "");
  static RxString _message = RxString("");
  static RxString get message => _message;

  // Initial
  static Future<void> initializeApp() async {
    await Firebase.initializeApp();
    token = (await messaging.getToken())!;
    print(
        "FCM Token: $token"); // TODO: Implementar un servicio para enviar el token a la base de datos, como se guarda automaticamente en la base de datos, esto serviria para enviar notificaciones masivas
    // Create three events
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  }

  static Future _onBackgroundHandler(RemoteMessage message) async {
    // _messageStream.add(message.data["message"]);
    messageModel.message.value = message.data["message"];
    _message.value = message.data["message"];
    print(
        "_onBackgroundHandler: ${message.notification} ${message.messageId} ${message.data["message"]}");
    AwesomeNotifications().createNotificationFromJsonData(message.data);
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // _messageStream.add(message.data["message"]);
    messageModel.message.value = message.data["message"];
    _message.value = message.data["message"];
    print(
        "_onMessageHandler: ${message.notification} ${message.messageId} ${message.data["message"]}");
    AwesomeNotifications().createNotificationFromJsonData(message.data);
  }

  static Future<void> _onMessageOpenedApp(RemoteMessage message) async {
    // _messageStream.add(message.data["message"]);
    messageModel.message.value = message.data["message"];
    _message.value = message.data["message"];
    print(
        "_onMessageOpenedApp: ${message.notification} ${message.messageId} ${message.data["message"]}");
    AwesomeNotifications().createNotificationFromJsonData(message.data);
  }

  static close() {
    // _messageStream.close();
  }
}
