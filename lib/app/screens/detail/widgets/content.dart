import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hcduoapp/app/core/theme/app_theme.dart';
import 'package:hcduoapp/app/data/models/historia_model.dart';
import 'package:hcduoapp/app/data/models/imagenes_model.dart';
import 'package:hcduoapp/app/screens/detail/widgets/content_information.dart';

class Content extends StatelessWidget {
  Content({
    required this.historia,
  });

  final HistoriaModel historia;

  @override
  Widget build(BuildContext context) {
    List<ImagenesModel> arrTags = historia.imagenes as List<ImagenesModel>;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.60,
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0,
          bottom: 20.0,
        ),
        decoration: const BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: SvgPicture.asset(
                              "assets/icons/location.svg",
                              width: 18.0,
                              color: Colors.black54,
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "${historia.estadoHistoria}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400),
                            ),
                          ))
                        ],
                      )),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "${historia.nombres}",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: AppTheme.blueDark,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                const CircleAvatar(
                  foregroundImage: NetworkImage(
                      "https://www.historiaclinicaduo.com/blogs/default_avatar_male.jpg"),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(children: _utilitiesTags(context, arrTags)),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                _infoRoom(
                    context: context,
                    count: 0,
                    pathImg: "assets/icons/bedroom.svg"),
                const SizedBox(
                  width: 40.0,
                ),
                _infoRoom(
                    context: context,
                    count: 0,
                    pathImg: "assets/icons/bathroom.svg"),
                const SizedBox(
                  width: 40.0,
                ),
                _infoRoom(
                    context: context,
                    count: 0,
                    pathImg: "assets/icons/menu.svg"),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            ContentInformation(
              historia: historia,
            ),
          ],
        ),
      ),
    );
  }

  _utilitiesTags(BuildContext context, List<ImagenesModel> arrTags) {
    List<Widget> tags = [];

    arrTags.asMap().forEach((index, element) {
      tags.add(Text(
        "tab $index",
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
      ));

      if (index < arrTags.length - 1) {
        tags.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: AppTheme.cyan.withOpacity(0.7),
              radius: 2.0,
            ),
          ),
        );
      }
    });
    return tags;
  }

  _infoRoom({
    required BuildContext context,
    required String pathImg,
    required int count,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          pathImg,
          width: 22.0,
          color: Colors.cyan,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              "$count",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
            ))
      ],
    );
  }
}
