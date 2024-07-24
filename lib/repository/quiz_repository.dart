
import '../core/exports.dart';
import '../models/quiz_model.dart';

abstract class QuizRepository {
  Future<ApiResult<List<QuizModel>>> getQuizes(int category);
}

// impl
class QuizRepositoryImpl extends QuizRepository {
  @override
  Future<ApiResult<List<QuizModel>>> getQuizes(int category) async {
     try {
      final client = inject<HttpService>().client();
      final response = await client.get('?amount=5&category=$category&type=multiple');
      
      List<dynamic> responseData = response.data['results'];
      List<QuizModel> detailList = responseData
          .map((data) => QuizModel.fromJson(data)).toList();
     
      return ApiResult.success(data: detailList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }
}