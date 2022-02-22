import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/screens/detail/detail_controller.dart';
import 'package:hcduoapp/app/screens/detail/widgets/appbar_actions.dart';
import 'package:hcduoapp/app/screens/detail/widgets/content.dart';
import 'package:hcduoapp/app/screens/detail/widgets/footer.dart';
import 'package:hcduoapp/app/screens/detail/widgets/header.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) => Scaffold(
        //appBar: AppBar(),
        body: Stack(
          children: [
            Header(
                path:
                    "https://www.historiaclinicaduo.com/blogs/default_avatar_male.jpg"),
            AppBarActions(aviable: _.historia.estadoHistoria ?? ""),
            Content(historia: _.historia),
            Footer(historia: _.historia),
          ],
        ),
      ),
    );
  }
}
