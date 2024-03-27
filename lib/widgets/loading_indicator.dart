import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io' show Platform;

import 'package:github_search/constants.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoActivityIndicator(
            color: kTextPlaceholder,
          )
        : const CircularProgressIndicator(
            color: kTextPlaceholder,
          );
  }
}
