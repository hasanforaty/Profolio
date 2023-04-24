import 'package:flutter/material.dart';
import 'package:profolio/constance/constance.dart';

class MyImageContainer extends StatelessWidget {
  const MyImageContainer({Key? key, required this.child}) : super(key: key);
  final double radius = 80;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: getBoxDecoration(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: radius + 20,
              ),
              child,
            ],
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: -radius,
          child: CircleAvatar(
            radius: radius + 10,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: CircleAvatar(
              radius: radius,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.asset("images/selfi.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
