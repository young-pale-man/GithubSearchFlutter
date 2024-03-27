import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_search/constants.dart';
import 'package:github_search/screens/loading_screen.dart';

var kAppTheme = ColorScheme.fromSeed(seedColor: kBackgroundMainColor);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
    (fn) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: kAppTheme,
        useMaterial3: true,
        primaryColor: kAccentPrimary,
      ),
      home: const LoadingScreen(),
    );
  }
}
