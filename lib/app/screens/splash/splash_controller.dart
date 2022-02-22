import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/data/models/logo_model.dart';
import 'package:hcduoapp/app/routes/app_routes.dart';

class SplashController extends GetxController {
  // late AnimationController animationController;
  // late Animation<Offset> hoverAnimation;

  // List of logos
  RxList<LogoModel> logos = RxList<LogoModel>([
    LogoModel(
      path: 'assets/images/logo_hc_amarillo.png',
      color: const Color.fromARGB(248, 226, 44, 12),
    ),
    LogoModel(
      path: 'assets/images/logo_hc_azul.png',
      color: const Color.fromARGB(65, 180, 249, 12),
    ),
    LogoModel(
      path: 'assets/images/logo_hc_morado.png',
      color: const Color.fromARGB(95, 4, 105, 12),
    ),
    LogoModel(
      path: 'assets/images/logo_hc_rojo.png',
      color: const Color.fromARGB(95, 4, 105, 12),
    ),
  ]);

  RxInt currentIndex = RxInt(0);

  @override
  void onInit() {
    // currentIndex.value = Random().nextInt(logos.length);
    // animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 700),
    // )..repeat(
    //     reverse: true,
    //   );
    // hoverAnimation =
    //     Tween(begin: const Offset(0, 0), end: const Offset(0, 0.02))
    //         .animate(animationController);
    super.onInit();
  }

  @override
  void onReady() {
    _doLogin();
    super.onReady();
  }

  @override
  void onClose() {
    // animationController = null as AnimationController;
    // hoverAnimation = null as Animation<Offset>;
    super.onClose();
  }

  _doLogin() async {
    try {
      await Future.delayed(
        const Duration(seconds: 2),
        () => Get.offNamed(AppRoutes.LOGIN),
      );
    } catch (e) {
      print(e);
    }
  }
}
