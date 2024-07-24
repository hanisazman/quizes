import 'package:hive/hive.dart';

part 'quiz_model.g.dart';

@HiveType(typeId: 1)
class QuizModel extends HiveObject {
  @HiveField(0)
  String type; // multiple/boolean
  @HiveField(1)
  String difficulty;
  @HiveField(2)
  String category;
  @HiveField(3)
  String question;
  @HiveField(4)
  String correctAnswer;
  @HiveField(5)
  List<String> incorrectAnswers;

  QuizModel({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    try {
      return QuizModel(
        type: json["type"],
        difficulty: json["difficulty"],
        category: json["category"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: json["incorrect_answers"] == null
            ? []
            : List<String>.from(json["incorrect_answers"].map((x) => x)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "difficulty": difficulty,
        "category": category,
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
      };

  @override
  String toString() {
    return 'QuizModel(category: $category, question: $question)';
  }
}
