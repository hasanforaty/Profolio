import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profolio/blocs/project_filter_bloc.dart';
import 'package:profolio/module/project_model.dart';
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
            _ProjectsList(),
          ],
        ),
      );
    });
  }
}

class _ProjectsList extends StatefulWidget {
  const _ProjectsList({Key? key}) : super(key: key);

  @override
  State<_ProjectsList> createState() => _ProjectsListState();
}

class _ProjectsListState extends State<_ProjectsList> {
  bool Function(ProjectModel) getFilter(ProjectType? type) {
    if (type == null) return (_) => true;
    return (pType) => pType.type == type;
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    var selectedTheme = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: Colors.lightBlueAccent);
    var otherTheme = Theme.of(context).textTheme.bodyMedium;
    var projectFilterBloc = context.read<ProjectFilterBloc>();
    return Container(
      decoration: getBoxDecoration(context),
      child: LayoutBuilder(builder: (context, _) {
        return BlocBuilder<ProjectFilterBloc, ProjectType?>(
            builder: (context, filterType) {
          return Column(
            children: [
              Container(
                decoration: getBoxDecoration(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Text(
                        localization?.allProjects ?? "",
                        style: filterType == null ? selectedTheme : otherTheme,
                      ),
                      onTap: () {
                        projectFilterBloc.change(null);
                      },
                    ),
                    GestureDetector(
                      child: Text(
                        localization?.enterpriseProject ?? "",
                        style: filterType == ProjectType.enterprise
                            ? selectedTheme
                            : otherTheme,
                      ),
                      onTap: () {
                        projectFilterBloc.change(ProjectType.enterprise);
                      },
                    ),
                    GestureDetector(
                      child: Text(
                        localization?.demoProjects ?? "",
                        style: filterType == ProjectType.demo
                            ? selectedTheme
                            : otherTheme,
                      ),
                      onTap: () {
                        projectFilterBloc.change(ProjectType.demo);
                      },
                    ),
                    GestureDetector(
                      child: Text(
                        localization?.practicalProjects ?? "",
                        style: filterType == ProjectType.practice
                            ? selectedTheme
                            : otherTheme,
                      ),
                      onTap: () {
                        projectFilterBloc.change(ProjectType.practice);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              for (var item in getMyAllProjects(context)
                  .where(getFilter(filterType))) ...[
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
        });
      }),
    );
  }
}
