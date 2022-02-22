import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcduoapp/app/core/theme/app_theme.dart';
import 'package:hcduoapp/app/screens/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.cyan,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/dentist.svg",
                  width: 76.0, height: 78.0),
              RichText(
                text: TextSpan(
                  text: "Historia Clínica",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: AppTheme.blueDark,
                        fontWeight: FontWeight.w900,
                      ),
                  children: [
                    TextSpan(
                      text: "DUO",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const SizedBox(
                width: 40.0,
                child: LinearProgressIndicator(
                  backgroundColor: AppTheme.blueDark,
                  color: AppTheme.cyan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
