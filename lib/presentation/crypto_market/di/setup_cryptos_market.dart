import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/data/data.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:dio/dio.dart';

void setupCryptosMarket() {
  getIt.registerLazySingleton<CryptosMarketDatasource>(
    () => CryptosMarketDatasource(getIt<Dio>()),
  );

  getIt.registerLazySingleton<CryptosMarketRepository>(
    () => CryptosMarketRepository(getIt<CryptosMarketDatasource>()),
  );

  getIt.registerLazySingleton<CryptosMarketUseCase>(
    () => CryptosMarketUseCase(getIt<CryptosMarketRepository>()),
  );

  getIt.registerFactory<CryptoMarketBloc>(
    () => CryptoMarketBloc(getIt<CryptosMarketUseCase>()),
  );
}
