import 'package:flutter/material.dart';
import 'package:github_search/widgets/result_card.dart';
import 'package:github_search/constants.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key, required this.searchResults});

  final List<dynamic> searchResults;

  int isLengthFiveteen() {
    if (searchResults.length >= 15) {
      return 15;
    } else {
      return searchResults.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'What we have found',
              style: kHeaderMain.copyWith(color: kAccentPrimary),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: searchResults.isEmpty
              ? const Center(
                  child: Text(
                    'Nothing was find for your search.\nPlease check the spelling',
                    style: kHeaderBody,
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  itemCount: isLengthFiveteen(),
                  itemBuilder: (context, index) => ResultCard(
                    key: ValueKey(searchResults[index]['id']),
                    resultID: searchResults[index]['id'],
                    resultTitle: searchResults[index]['name'],
                  ),
                ),
        ),
      ],
    );
  }
}
