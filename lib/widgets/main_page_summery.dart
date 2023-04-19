import 'package:flutter/material.dart';
import 'package:profolio/constance/constance.dart';

class SummeryWidget extends StatelessWidget {
  const SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: -80,
          child: CircleAvatar(
            radius: 80,
            child: Image.asset("images/selfi.png"),
          ),
        ),
      ],
    );
  }
}
