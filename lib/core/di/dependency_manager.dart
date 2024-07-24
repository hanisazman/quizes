
import 'package:get_it/get_it.dart';
import '../../repository/quiz_repository.dart';
import '../exports.dart';

final GetIt getIt = GetIt.instance;

void setUpDependencies() {
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerSingleton<QuizRepository>(QuizRepositoryImpl());
}

final quizRepository = getIt.get<QuizRepository>();