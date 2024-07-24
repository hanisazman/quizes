import 'package:dio/dio.dart';

class HttpService {
  Dio client() => Dio(
        BaseOptions(
          baseUrl: 'https://opentdb.com/api.php',
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
          },
        ),
      );
      //  ..interceptors
      //       .add(LogInterceptor(responseBody: true, requestBody: true));
}
