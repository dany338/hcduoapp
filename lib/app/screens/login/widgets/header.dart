import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcduoapp/app/core/theme/app_theme.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/dentist.svg",
            width: 76.0,
            height: 78.0,
          ),
          RichText(
            text: TextSpan(
              text: "Historia Clínica",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: AppTheme.blueDark, fontWeight: FontWeight.w900),
              children: [
                TextSpan(
                  text: "DUO",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
