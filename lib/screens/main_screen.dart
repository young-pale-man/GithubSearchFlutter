import 'package:flutter/material.dart';
import 'package:github_search/components/boxes.dart';
import 'package:github_search/constants.dart';
import 'package:github_search/models/github_service.dart';
import 'package:github_search/models/repo.dart';
import 'package:github_search/screens/favorites_screen.dart';
import 'package:github_search/widgets/active_button.dart';
import 'package:github_search/widgets/loading_indicator.dart';
import 'package:github_search/widgets/search_field.dart';
import 'package:github_search/widgets/search_history.dart';
import 'package:github_search/widgets/search_results.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MainScreen();
  }
}

class _MainScreen extends State<MainScreen> {
  List<dynamic> _searchResults = [];
  bool wasSearch = false;
  bool loadingWidget = false;

  void _performSearch(String query) {
    setState(() {
      loadingWidget = true;
    });
    GitHubService().searchRepositories(query).then((results) {
      setState(() {
        _searchResults = results;
        if (results.isNotEmpty) {
          boxUserSearches.put(
            results[0]['id'],
            Repo(
              title: results[0]['name'],
            ),
          );
        }
        wasSearch = true;
        loadingWidget = false;
      });
    }).catchError((error) {
      print('Search error: $error');
    });
  }

  Widget mainScreenWidget() {
    if (loadingWidget) {
      return const LoadingIndicator();
    } else if (wasSearch) {
      return Expanded(
        child: SearchResults(
          key: GlobalKey(),
          searchResults: _searchResults,
        ),
      );
    } else {
      return Expanded(
        child: SearchHistory(
          key: GlobalKey(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundMainColor,
        toolbarHeight: 64,
        title: Text(
          'Github repos list',
          style: kHeaderMain.copyWith(color: kTextPrimary),
        ),
        actions: [
          ActiveButton(
            assetAdress: "lib/assets/Favorite_active.png",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              ).then((_) => setState(() {}));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                SearchField(
                  onInput: _performSearch,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            mainScreenWidget(),
          ],
        ),
      ),
    );
  }
}
