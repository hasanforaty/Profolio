import 'package:flutter/material.dart';
import 'package:profolio/widgets/main_page_summery.dart';
import 'package:profolio/widgets/project_item_widget.dart';

import '../constance/constance.dart';
import '../widgets/day_night_widget.dart';
import '../widgets/select_local_widget.dart';
import '../widgets/social_media_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, _) {
      var localization = AppLocalizations.of(context);
      checkWindow();
      double padding;
      if (kIsWindow) {
        padding = (MediaQuery.of(context).size.width) / 10;
      } else {
        padding = 16;
      }
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: kIsWindow ? const SocialMediaWidgets() : Container(),
          leading: Builder(builder: (newContext) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: () {
                print("${Scaffold.of(newContext).isDrawerOpen}");
                setState(() {
                  Scaffold.of(newContext).isDrawerOpen
                      ? Scaffold.of(newContext).closeDrawer()
                      : Scaffold.of(newContext).openDrawer();
                });
              },
            );
          }),
          actions: const [
            SizedBox(
              width: 32,
            ),
            DayAndNightWidget(),
            SizedBox(
              width: 32,
            ),
            SelectLocalWidget(),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(padding),
          children: [
            const SizedBox(
              height: 32,
            ),
            SummeryWidget(
              label: localization?.projectSummeryTitle ?? "",
              explanation: localization?.projectSummery ?? "",
            ),
            const SizedBox(
              height: 32,
            ),
            const _ProjectsList(),
          ],
        ),
      );
    });
  }
}

class _ProjectsList extends StatelessWidget {
  const _ProjectsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getBoxDecoration(context),
      child: LayoutBuilder(builder: (context, _) {
        return Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            for (var item in getMyAllProjects(context)) ...[
              kIsMobile
                  ? ProjectItem(model: item)
                  : ProjectWebItem(model: item),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                indent: 32,
                endIndent: 32,
                height: 4,
              ),
              const SizedBox(
                height: 8,
              ),
            ]
          ],
        );
      }),
    );
  }
}
