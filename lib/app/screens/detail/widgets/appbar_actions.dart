import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppBarActions extends StatelessWidget {
  AppBarActions({required this.aviable});

  final String aviable;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              width: 180.0,
              height: 40.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:
                    aviable == 'ACTIVA' ? Colors.green[600] : Colors.red[600],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                aviable,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
