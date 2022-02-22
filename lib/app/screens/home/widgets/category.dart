import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hcduoapp/app/core/theme/app_theme.dart';
import 'package:hcduoapp/app/data/models/category_model.dart';
import 'package:hcduoapp/app/screens/home/home_controller.dart';

class Category extends StatelessWidget {
  // const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => SliverToBoxAdapter(
        child: SizedBox(
          height: 100.0,
          child: ListView.builder(
            //shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _.selectedIndex(index);
                },
                child: ItemCategory(
                  category: categories[index],
                  index: index,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    Key? key,
    @required this.category,
    @required this.index,
  }) : super(key: key);

  final CategoryModel? category;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Obx(
        () {
          bool isSelected = index == _.isSelectedIndex.value ? true : false;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 85.0,
            margin: EdgeInsets.only(
              left: isSelected ? 20.0 : 11.0,
              bottom: isSelected ? 0 : 20.0,
            ),
            decoration: BoxDecoration(
              color: index == _.isSelectedIndex.value
                  ? AppTheme.cyan
                  : Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  category!.path ?? "",
                  width: 30.0,
                  color: isSelected
                      ? Colors.white
                      : AppTheme.light.withOpacity(.5),
                ),
                isSelected
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            right: 5.0,
                            left: 5.0,
                          ),
                          child: Text(
                            category!.name ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          );
        },
      ),
    );
  }
}
