import 'package:hive/hive.dart';

part 'score_model.g.dart';

@HiveType(typeId: 2)
class ScoreModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String categories;
  @HiveField(3)
  int score;
  @HiveField(4)
  String date;
  @HiveField(5)
  int totalCorrectAnswer;
  @HiveField(6)
  int totalQuestion;

  ScoreModel(
      {required this.id,
      required this.name,
      required this.categories,
      required this.score,
      required this.date,
      required this.totalCorrectAnswer,
      required this.totalQuestion});
}
