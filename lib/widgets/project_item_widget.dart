import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:profolio/module/project_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';

class ProjectItem extends StatelessWidget {
  final ProjectModel model;
  const ProjectItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Container(
      color: Colors.transparent,
      width: 200,
      height: 600,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: Image.asset(
                model.imageUrl,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Center(
            child: Text(
              model.title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            model.explanation,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            localization?.techStack ?? "",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var icon in model.techStack)
                Icon(
                  icon,
                  size: 64,
                )
            ],
          ),
        ],
      ),
    );
  }
}
