import 'package:flutter/material.dart';

import 'package:profolio/constance/constance.dart';
import 'package:profolio/main.dart';
import 'package:profolio/widgets/custom_drawer.dart';
import 'package:profolio/widgets/day_night_widget.dart';
import 'package:profolio/widgets/main_page_summery.dart';
import 'package:profolio/widgets/projects_summery.dart';
import 'package:profolio/widgets/select_local_widget.dart';
import 'package:profolio/widgets/skill_and_experience_widget.dart';
import 'package:profolio/widgets/social_media_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool drawerOpened = false;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState

    super.setState(fn);
  }

  void drawerToggle() {}
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, _) {
      checkWindow();
      double padding;
      var localization = AppLocalizations.of(context);
      if (kIsWindow) {
        padding = (MediaQuery.of(context).size.width) / 10;
      } else {
        padding = 16;
      }
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        onDrawerChanged: (opened) {
          print("clicked ${opened}");
        },
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
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: padding),
          children: [
            const SizedBox(
              height: 100,
            ),
            SummeryWidget(
              label: localization?.name ?? "",
              explanation: localization?.aboutMe ?? "",
            ),
            const SizedBox(
              height: 20,
            ),
            const ProjectSummery(),
            const SizedBox(
              height: 20,
            ),
            const SkillAndExperience(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    });
  }
}
