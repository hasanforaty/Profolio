import 'package:flutter/material.dart';

class ProjectModel {
  String title;
  String explanation;
  String imageUrl;
  String? gitHubUrl;
  String? applicationUrl;
  bool restricted;
  List<String> techStack;
  ProjectType type;

  ProjectModel(
      {required this.title,
      required this.explanation,
      required this.imageUrl,
      required this.techStack,
      this.gitHubUrl,
      this.restricted = true,
      this.applicationUrl,
      required this.type});
}

enum ProjectType {
  practice,
  enterprise,
  demo,
}
