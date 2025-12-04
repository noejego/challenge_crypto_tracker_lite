import 'package:dio/dio.dart';

class DioClient {
  static Dio create() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.coingecko.com/api/v3',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: <String, dynamic>{'Content-Type': 'application/json'},
      ),
    );

    return dio;
  }
}
