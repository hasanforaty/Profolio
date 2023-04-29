import 'package:flutter/material.dart';
import 'package:profolio/constance/constance.dart';
import 'package:profolio/widgets/my_image_container_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profolio/widgets/social_media_widgets.dart';

class SummeryWidget extends StatelessWidget {
  const SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return MyImageContainer(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        textDirection: getTextDirection(context),
        children: [
          Text(
            localization?.name ?? "",
            textDirection: getTextDirection(context),
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            localization?.aboutMe ?? "",
            textDirection: getTextDirection(context),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 16,
          ),
          LayoutBuilder(builder: (_, __) {
            return kIsMobile ? const SocialMediaWidgets() : Container();
          }),
        ],
      ),
    ));
  }
}
