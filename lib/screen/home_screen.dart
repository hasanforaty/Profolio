import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profolio/constance/constance.dart';
import 'package:profolio/widgets/custom_drawer.dart';
import 'package:profolio/widgets/main_page_summery.dart';
import 'package:profolio/widgets/projects_summery.dart';

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
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              SizedBox(
                height: 100,
              ),
              SummeryWidget(),
              SizedBox(
                height: 20,
              ),
              ProjectSummery()
            ],
          ),
        ),
      );
    });
  }
}
