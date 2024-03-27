import 'package:hive/hive.dart';

part 'repo.g.dart';

@HiveType(typeId: 1)
class Repo {
  Repo({
    required this.title,
    this.isFavorite = true,
  });

  @HiveField(1)
  String title;

  @HiveField(2)
  bool isFavorite;
}
