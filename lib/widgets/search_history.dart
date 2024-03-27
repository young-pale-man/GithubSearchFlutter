import 'package:flutter/material.dart';
import 'package:github_search/components/boxes.dart';
import 'package:github_search/constants.dart';
import 'package:github_search/widgets/result_card.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Search History',
              style: kHeaderMain.copyWith(color: kAccentPrimary),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: boxUserSearches.isEmpty
              ? const Center(
                  child: Text(
                    'You have empty history.\nClick on search to start journey!',
                    style: kHeaderBody,
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  itemCount: boxUserSearches.length,
                  itemBuilder: (context, index) => ResultCard(
                      key: ValueKey(boxUserSearches.keyAt(index)),
                      resultID: boxUserSearches.keyAt(index),
                      resultTitle: boxUserSearches.getAt(index).title),
                ),
        ),
      ],
    );
  }
}
