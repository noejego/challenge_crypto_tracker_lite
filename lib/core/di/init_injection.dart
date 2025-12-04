import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjection() async {
  getIt.registerLazySingleton<Dio>(DioClient.create);
  setupCryptosMarket();
  setupCryptoDetails();
  setupCryptoMarketChart();
  setupCryptoFavorite();
}
