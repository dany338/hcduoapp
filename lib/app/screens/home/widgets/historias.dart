import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:hcduoapp/app/core/theme/app_theme.dart';
import 'package:hcduoapp/app/data/models/historia_model.dart';
import 'package:hcduoapp/app/routes/app_routes.dart';
import 'package:hcduoapp/app/screens/home/home_controller.dart';

class Historias extends StatelessWidget {
  // const Historias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => SliverPadding(
        padding:
            const EdgeInsets.only(bottom: kBottomNavigationBarHeight * 1.5),
        sliver: Obx(
          () => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ItemHistoria(historia: _.historias[index]),
              childCount: _.historias.length,
            ),
          ),
        ),
      ),
    );
  }
}

class ItemHistoria extends StatelessWidget {
  ItemHistoria({
    required this.historia,
  });

  final HistoriaModel? historia;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.DETAIL, arguments: historia),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20.0,
          right: 20.0,
        ),
        child: Hero(
          tag: "key_name_${historia!.id}",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: AspectRatio(
              aspectRatio: .90,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    historia!.imagenes![0].url.toString(),
                    fit: BoxFit.fill,
                  ),
                  _Location(direccion: historia?.direccion ?? ""),
                  _DetailHistoria(historia: historia ?? HistoriaModel()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Location extends StatelessWidget {
  const _Location({this.direccion});

  final String? direccion;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 7.5,
        ),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/location.svg',
              width: 15,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                direccion ?? "",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailHistoria extends StatelessWidget {
  const _DetailHistoria({@required this.historia});

  final HistoriaModel? historia;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            //Positioned(right: 15, top: -42.5, child: ButtonFavorite()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    historia!.nombres ?? "",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppTheme.blueDark, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 14,
                              backgroundImage: NetworkImage(
                                  "https://www.historiaclinicaduo.com/blogs/image-blog-male.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                historia!.codigo ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: AppTheme.blueDark),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${historia!.documento}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: AppTheme.blueDark,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingAndReviews(
                          rating: 4,
                          reviews: 145,
                        ),
                        //Facilities(house: house),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingAndReviews extends StatelessWidget {
  RatingAndReviews({
    this.reviews,
    required this.rating,
  });

  final int? reviews;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SvgPicture.asset(
                'assets/icons/star.svg',
                width: 15,
                color: (index < rating) ? AppTheme.cyan : Colors.black12,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            '$reviews opinions',
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.black26),
          ),
        ),
      ],
    );
  }
}
