import 'package:challenge_crypto_tracker_lite/core/core.dart';

class BaseResponse<T> {
  final T? data;
  final AppException? error;

  BaseResponse.success(this.data) : error = null;
  BaseResponse.failure(this.error) : data = null;

  bool get isSuccess => data != null;
}
