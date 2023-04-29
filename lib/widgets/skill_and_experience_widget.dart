import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profolio/constance/constance.dart';
import 'package:profolio/constance/custom_icon_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profolio/widgets/experience_item.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 16,
          ),
          Center(
            child: Text(
              localization?.skillAndExperience ?? "",
              textDirection: getTextDirection(context),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              localization?.skillAndExperienceIntro ?? "",
              textDirection: getTextDirection(context),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 80,
                crossAxisSpacing: 90,
                mainAxisSpacing: 60),
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return SvgPicture.asset(
                _list[index],
                height: 40,
                width: 40,
              );
            },
            shrinkWrap: true,
            itemCount: _list.length,
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
          const SizedBox(
            height: 16,
          ),
          GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return Center(
                  child: ExperienceItem(
                      model: getExperienceItems(context)[index]));
            },
            itemCount: getExperienceItems(context).length,
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}
