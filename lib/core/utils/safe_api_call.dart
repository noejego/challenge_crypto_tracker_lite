import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:dio/dio.dart';

Future<BaseResponse<T>> safeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    final T result = await apiCall();
    return BaseResponse<T>.success(result);
  } on DioException catch (e) {
    return BaseResponse<T>.failure(
      AppException(
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage ?? e.message ?? 'Error desconocido',
      ),
    );
  } on AppException catch (e) {
    return BaseResponse<T>.failure(
      AppException(statusCode: 0, message: 'Error inesperado: $e'),
    );
  }
}
