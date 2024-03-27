import 'package:flutter/material.dart';
import 'package:github_search/components/boxes.dart';
import 'package:github_search/constants.dart';
import 'package:github_search/models/repo.dart';
import 'package:github_search/screens/main_screen.dart';
import 'package:github_search/widgets/loading_indicator.dart';
import 'package:hive_flutter/adapters.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreen();
  }
}

class _LoadingScreen extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    loadDatabases();
  }

  void loadDatabases() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RepoAdapter());
    boxFavoritesRepositories = await Hive.openBox<Repo>('favoriteRepositories');
    boxUserSearches = await Hive.openBox<Repo>('userSearches');

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const MainScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentPrimary,
      body: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Search App',
                style: kHeaderBody.copyWith(color: kBackgroundMainColor),
              ),
              const SizedBox(
                height: 10,
              ),
              const LoadingIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
