import 'package:hive_flutter/hive_flutter.dart';

// models
import '../../models/user_model.dart';
import '../../models/quiz_model.dart';
import '../../models/score_model.dart';

class HiveBox {
  static const String boxName = 'items';

  static Future<void> init() async {
    await Hive.initFlutter();

    // register adapters
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(QuizModelAdapter());
    Hive.registerAdapter(ScoreModelAdapter());

    // open box only if it's not already open
    if (!Hive.isBoxOpen('userBox')) {
      await Hive.openBox<UserModel>('userBox');
    }
    if (!Hive.isBoxOpen('quizBox')) {
      await Hive.openBox<QuizModel>('quizBox');
    }
    if (!Hive.isBoxOpen('scoreBox')) {
      await Hive.openBox<ScoreModel>('scoreBox');
    }
  }
}
