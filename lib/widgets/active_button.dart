import 'package:flutter/material.dart';
import 'package:github_search/constants.dart';

class ActiveButton extends StatelessWidget {
  const ActiveButton({
    super.key,
    required this.assetAdress,
    required this.onPressed,
  });

  final String assetAdress;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: kAccentPrimary,
          ),
          child: Center(
            child: ImageIcon(
              AssetImage(assetAdress),
              color: kBackgroundMainColor,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
