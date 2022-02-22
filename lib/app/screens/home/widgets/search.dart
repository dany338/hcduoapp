import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hcduoapp/app/core/theme/app_theme.dart';
import 'package:hcduoapp/app/global/sliver_header_delegate.dart';

class Search extends StatelessWidget {
  // const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      //floating: true,
      pinned: true,
      delegate: SliverHeaderDelegate(
        maxHeight: 95.0,
        minHeight: 95.0,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: SvgPicture.asset('assets/icons/search-home.svg'),
              ),
              Expanded(
                child: CupertinoTextField(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: const BoxDecoration(),
                  placeholder: 'What are you looking for?',
                  placeholderStyle: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(
                          color: AppTheme.searchColor,
                          fontWeight: FontWeight.w100),
                  cursorColor: AppTheme.searchColor,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: AppTheme.searchColor,
                        fontWeight: FontWeight.w100,
                      ),
                ),
              ),
              const Icon(
                Icons.settings_input_component_outlined,
                color: AppTheme.blueDark,
              )
            ],
          ),
        ),
      ),
    );
  }
}
