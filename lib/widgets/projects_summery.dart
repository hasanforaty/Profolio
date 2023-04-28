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
          children: [
            Text(
              localization?.projectSummeryTitle ?? "",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              localization?.projectSummery ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
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
        height: kIsWindow ? 600 : null,
        width: kIsMobile ? 200 : null,
        child: ListView(
          scrollDirection: kIsMobile ? Axis.vertical : Axis.horizontal,
          shrinkWrap: true,
          children: [
            for (var item in getMyProjects(context)) ...[
              ProjectItem(model: item)
            ],
          ],
        ),
      );
    });
  }
}
