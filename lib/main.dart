import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/core/utils/dependecy_injection.dart';
import 'package:hcduoapp/app/core/utils/push_notification_service.dart';
import 'package:hcduoapp/app/routes/app_pages.dart';
import 'package:hcduoapp/app/routes/app_routes.dart';
import 'package:hcduoapp/main_controller.dart';

void main() async {
  DependencyInjection.load();
  WidgetsFlutterBinding
      .ensureInitialized(); // Generar el contexto de inicio para toda el app
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: "channel_1",
      channelName: 'Historia Clínica',
      channelDescription: 'Notifiación de historias',
      defaultColor: const Color(0XFF9050DD),
      ledColor: Colors.white,
      playSound: true,
      enableLights: true,
      enableVibration: true,
    ),
  ]);
  await PushNotificationService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (_) => ScreenUtilInit(
        designSize: const Size(360, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => GetMaterialApp(
          title: 'Historia Clínica Duo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: AppRoutes.SPLASH,
          getPages: AppPages.pages,
        ),
      ),
    );
  }
}
