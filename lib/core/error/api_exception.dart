class AppException implements Exception {
  final int? statusCode;
  final String message;

  AppException({required this.message, this.statusCode});

  @override
  String toString() =>
      'AppException(statusCode: $statusCode, message: $message)';
}
