import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profolio/constance/colors.dart';
import 'package:profolio/module/experience_model.dart';

class ExperienceItem extends StatelessWidget {
  final ExperienceModel model;
  const ExperienceItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CircleAvatar(
              radius: 42,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: SvgPicture.asset(
                  model.logoUrl,
                  width: 60,
                  color: Theme.of(context).colorScheme.primary == primaryDark
                      ? primaryDay
                      : primaryDark,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
            width: 16,
          ),
          Text(
            model.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
            width: 8,
          ),
          Text(
            model.description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
