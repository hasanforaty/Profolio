import 'package:flutter/material.dart';
import 'package:profolio/constance/constance.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            )
          ],
        ),
      ),
    );
  }
}
