import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/core/theme/app_theme.dart';
import 'package:hcduoapp/app/global/button_navigator.dart';
import 'package:hcduoapp/app/screens/home/home_controller.dart';
import 'package:hcduoapp/app/screens/home/widgets/category.dart';
import 'package:hcduoapp/app/screens/home/widgets/header.dart';
import 'package:hcduoapp/app/screens/home/widgets/historias.dart';
import 'package:hcduoapp/app/screens/home/widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.background,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomScrollView(
                  slivers: [
                    Header(),
                    Search(),
                    Category(),
                    Obx(
                      () => getView(_.isSelectedIndex.value),
                    ),
                  ],
                ),
              ),
              const ButtonNavigator()
            ],
          ),
        ),
      ),
    );
  }
}

Widget getView(int indexView) {
  print("getView" + indexView.toString());
  switch (indexView) {
    case 0:
      return Historias();
    case 1:
      return Condominio();
    case 2:
      return KeysHouse();
    case 3:
      return Offerts();
    default:
  }

  return Historias();
}

class Condominio extends StatelessWidget {
  // const Condominio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(child: Text("Condominio"));
  }
}

class KeysHouse extends StatelessWidget {
  // const KeysHouse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text("KeysHouse"),
    );
  }
}

class Offerts extends StatelessWidget {
  // const Offerts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text("Offerts"),
    );
  }
}
