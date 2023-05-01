import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profolio/constance/custom_icon_icons.dart';
import 'package:profolio/module/project_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:js' as js;

import '../constance/constance.dart';

class ProjectItem extends StatelessWidget {
  final ProjectModel model;
  const ProjectItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Container(
      color: Colors.transparent,
      width: 200,
      height: 660,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        textDirection: getTextDirection(context),
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: model.imageUrl,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Center(
            child: Text(
              model.title,
              textDirection: getTextDirection(context),
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            model.explanation,
            textDirection: getTextDirection(context),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            localization?.techStack ?? "",
            textDirection: getTextDirection(context),
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var icon in model.techStack) ...[
                SvgPicture.asset(
                  icon,
                  width: 32,
                  height: 32,
                ),
                const SizedBox(
                  width: 8,
                  height: 8,
                )
              ]
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          model.gitHubUrl != null
              ? GestureDetector(
                  onTap: () {
                    js.context.callMethod("open", [model.gitHubUrl!]);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        CustomIcon.gitHub,
                        height: 16,
                        width: 16,
                      ),
                      RichText(
                        text: TextSpan(
                            text: localization?.seeGitHub ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    decoration: TextDecoration.underline)),
                      ),
                    ],
                  ),
                )
              : Container(),
          const SizedBox(
            height: 16,
          ),
          model.applicationUrl != null
              ? GestureDetector(
                  onTap: () {
                    js.context.callMethod("open", [model.applicationUrl!]);
                  },
                  child: RichText(
                    text: TextSpan(
                        text: localization?.seeFinalProduct ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(decoration: TextDecoration.underline)),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class ProjectWebItem extends StatelessWidget {
  final ProjectModel model;
  const ProjectWebItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        textDirection: getTextDirection(context),
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: CachedNetworkImage(
              height: 180,
              width: 280,
              fit: BoxFit.fill,
              imageUrl: model.imageUrl,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      model.title,
                      textDirection: getTextDirection(context),
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Text(
                      model.explanation,
                      textDirection: getTextDirection(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    localization?.techStack ?? "",
                    textDirection: getTextDirection(context),
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (var icon in model.techStack) ...[
                        SvgPicture.asset(
                          icon,
                          width: 32,
                          height: 32,
                        ),
                        const SizedBox(
                          width: 8,
                          height: 8,
                        )
                      ]
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  model.gitHubUrl != null
                      ? GestureDetector(
                          onTap: () {
                            js.context.callMethod("open", [model.gitHubUrl!]);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                CustomIcon.gitHub,
                                height: 16,
                                width: 16,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: localization?.seeGitHub ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            decoration:
                                                TextDecoration.underline)),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 16,
                  ),
                  model.applicationUrl != null
                      ? GestureDetector(
                          onTap: () {
                            js.context
                                .callMethod("open", [model.applicationUrl!]);
                          },
                          child: RichText(
                            text: TextSpan(
                                text: localization?.seeFinalProduct ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        decoration: TextDecoration.underline)),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
