import 'package:flutter/material.dart';
import 'package:github_search/constants.dart';

class SearchFieldButton extends StatelessWidget {
  const SearchFieldButton({
    super.key,
    required this.onPressed,
    required this.iconPath,
  });

  final Function() onPressed;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: ImageIcon(
        AssetImage(iconPath),
        color: kAccentPrimary,
        size: 24,
      ),
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }
}
