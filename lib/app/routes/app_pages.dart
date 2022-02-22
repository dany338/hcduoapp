import 'package:get/get.dart';
import 'package:hcduoapp/app/routes/app_routes.dart';
import 'package:hcduoapp/app/screens/detail/detail_binding.dart';
import 'package:hcduoapp/app/screens/detail/detail_screen.dart';
import 'package:hcduoapp/app/screens/home/home_binding.dart';
import 'package:hcduoapp/app/screens/home/home_screen.dart';
import 'package:hcduoapp/app/screens/login/login_binding.dart';
import 'package:hcduoapp/app/screens/login/login_screen.dart';
import 'package:hcduoapp/app/screens/notification/notification_binding.dart';
import 'package:hcduoapp/app/screens/notification/notification_screen.dart';
import 'package:hcduoapp/app/screens/splash/splash_binding.dart';
import 'package:hcduoapp/app/screens/splash/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      /* transitionDuration: const Duration(seconds: 5),
      transition: Transition.fadeIn, */
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAIL,
      transitionDuration: const Duration(milliseconds: 800),
      page: () => const DetailScreen(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: AppRoutes.NOTIFICATION,
      transitionDuration: const Duration(milliseconds: 400),
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
    ),
  ];
}
