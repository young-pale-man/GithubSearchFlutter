import 'package:flutter/material.dart';
import 'package:github_search/components/boxes.dart';
import 'package:github_search/constants.dart';
import 'package:github_search/widgets/active_button.dart';
import 'package:github_search/widgets/result_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundMainColor,
        toolbarHeight: 64,
        title: Text(
          'Favorite repos list',
          style: kHeaderMain.copyWith(color: kTextPrimary),
        ),
        leading: ActiveButton(
          assetAdress: 'lib/assets/left.png',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListView.builder(
          itemCount: boxFavoritesRepositories.length,
          itemBuilder: (context, index) => ResultCard(
            key: ValueKey(boxFavoritesRepositories.keyAt(index)),
            resultID: boxFavoritesRepositories.keyAt(index),
            resultTitle: boxFavoritesRepositories.getAt(index).title,
          ),
        ),
      ),
    );
  }
}
