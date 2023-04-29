import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profolio/constance/colors.dart';
import 'dart:js' as js;

class SocialMediaIcon extends StatefulWidget {
  final String iconUrl;
  final String internetUrl;
  const SocialMediaIcon(
      {Key? key, required this.iconUrl, required this.internetUrl})
      : super(key: key);

  @override
  State<SocialMediaIcon> createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<SocialMediaIcon> {
  static const Color onHoverColor = Colors.lightBlueAccent;
  late Color iconColor;
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (isHovered) {
        iconColor = onHoverColor;
      } else {
        iconColor = Theme.of(context).colorScheme.primary == primaryDay
            ? primaryDark
            : primaryDay;
      }
      return GestureDetector(
        onTap: () {
          setState(() {
            isHovered = false;
            js.context.callMethod("open", [widget.internetUrl]);
          });
        },
        child: MouseRegion(
          onHover: (_) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              isHovered = false;
            });
          },
          child: CircleAvatar(
            radius: 17,
            backgroundColor: iconColor,
            child: CircleAvatar(
              radius: 16,
              backgroundColor:
                  Theme.of(context).colorScheme.primary == primaryDay
                      ? primaryDay
                      : primaryDark,
              child: SvgPicture.asset(
                widget.iconUrl,
                color: iconColor,
              ),
            ),
          ),
        ),
      );
    });
  }
}
