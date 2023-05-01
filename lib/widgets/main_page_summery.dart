import 'package:flutter/material.dart';
import 'package:profolio/constance/constance.dart';
import 'package:profolio/widgets/my_image_container_widget.dart';
import 'package:profolio/widgets/social_media_widgets.dart';

class SummeryWidget extends StatelessWidget {
  final String label;
  final String explanation;
  const SummeryWidget(
      {Key? key, required this.label, required this.explanation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyImageContainer(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        textDirection: getTextDirection(context),
        children: [
          Text(
            label,
            textDirection: getTextDirection(context),
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            explanation,
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
