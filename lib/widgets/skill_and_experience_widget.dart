import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profolio/constance/constance.dart';
import 'package:profolio/constance/custom_icon_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _list = [
  CustomIcon.dart,
  CustomIcon.kotlin,
  CustomIcon.java,
  CustomIcon.android,
  CustomIcon.flutter,
];

class SkillAndExperience extends StatelessWidget {
  const SkillAndExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Container(
      decoration: getBoxDecoration(context),
      height: 300,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            localization?.skillAndExperience ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            localization?.skillAndExperienceIntro ?? "",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: 80,
                crossAxisSpacing: 8,
                mainAxisSpacing: 16),
            itemBuilder: (context, index) {
              return SvgPicture.asset(
                _list[index],
                height: 40,
                width: 40,
              );
            },
            shrinkWrap: true,
            itemCount: _list.length,
          )
        ],
      ),
    );
  }
}
