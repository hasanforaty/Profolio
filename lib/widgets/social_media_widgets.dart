import 'package:flutter/material.dart';
import 'package:profolio/widgets/social_media_icon.dart';

class SocialMediaWidgets extends StatelessWidget {
  const SocialMediaWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container()),
        const SocialMediaIcon(iconUrl: "logos/instagram.svg", internetUrl: ""),
        const SizedBox(
          width: 8,
        ),
        const SocialMediaIcon(
            iconUrl: "logos/stack_overflow.svg",
            internetUrl:
                "https://stackoverflow.com/users/13922303/hasan-foraty"),
        const SizedBox(
          width: 8,
        ),
        const SocialMediaIcon(
            iconUrl: "logos/github.svg",
            internetUrl: "https://github.com/hasanforaty"),
        Expanded(child: Container()),
      ],
    );
  }
}
