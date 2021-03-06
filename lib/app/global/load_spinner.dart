import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/core/theme/app_theme.dart';

class LoadSpinner {
  static show() {
    Get.dialog(
      Container(
        alignment: Alignment.center,
        height: 40.0,
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: const CircularProgressIndicator(
          color: AppTheme.blueDark,
        ),
      ),
      barrierColor: Colors.white60,
      barrierDismissible: false,
    );
  }

  static hide() {
    Get.back();
  }
}
