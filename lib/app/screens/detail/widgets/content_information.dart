import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hcduoapp/app/core/theme/app_theme.dart';
import 'package:hcduoapp/app/data/models/historia_model.dart';

class ContentInformation extends StatelessWidget {
  ContentInformation({
    required this.historia,
  });

  final HistoriaModel historia;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 20.0,
          ),
          decoration: const BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(color: Colors.black26, width: 0.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _tabOptions(
                  context: context,
                  title: "Information",
                  iconSvg: "assets/icons/info.svg",
                  isChecked: true),
              _tabOptions(
                  context: context,
                  title: "Comments",
                  iconSvg: "assets/icons/comments.svg"),
              _tabOptions(
                  context: context,
                  title: "Offers",
                  iconSvg: "assets/icons/menu-4.svg"),
              _tabOptions(
                  context: context,
                  title: "Shared",
                  iconSvg: "assets/icons/shared.svg"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "Description",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: AppTheme.blueDark, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "${historia.nombres}",
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  _tabOptions({
    required BuildContext context,
    required String iconSvg,
    required String title,
    bool? isChecked,
  }) {
    isChecked = isChecked ?? false;
    return Column(
      children: [
        SvgPicture.asset(
          iconSvg,
          width: 20.0,
          color: isChecked ? AppTheme.cyan : Colors.black26,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: isChecked ? AppTheme.cyan : Colors.black26,
                  fontWeight: FontWeight.w400),
            ))
      ],
    );
  }
}
