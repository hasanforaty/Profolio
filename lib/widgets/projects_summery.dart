import 'package:flutter/material.dart';
import 'package:profolio/constance/constance.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profolio/widgets/project_item_widget.dart';

class ProjectSummery extends StatelessWidget {
  const ProjectSummery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Container(
      decoration: getBoxDecoration(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          textDirection: getTextDirection(context),
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              localization?.projectSummeryTitle ?? "",
              textDirection: getTextDirection(context),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              localization?.projectSummery ?? "",
              textDirection: getTextDirection(context),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 16,
            ),
            const _ProjectList(),
          ],
        ),
      ),
    );
  }
}

class _ProjectList extends StatelessWidget {
  const _ProjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
        height: kIsWindow ? 660 : null,
        width: kIsMobile ? 200 : null,
        child: ListView(
          scrollDirection: kIsMobile ? Axis.vertical : Axis.horizontal,
          shrinkWrap: true,
          children: [
            for (var item in getMyProjects(context)) ...[
              ProjectItem(model: item),
              const SizedBox(
                width: 8,
                height: 8,
              )
            ],
          ],
        ),
      );
    });
  }
}
