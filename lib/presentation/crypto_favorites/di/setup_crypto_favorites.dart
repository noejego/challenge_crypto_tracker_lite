import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/data/data.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setupCryptoFavorite() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(preferences);

  getIt.registerLazySingleton<CryptoFavoritesRepository>(
    CryptoFavoritesRepository.new,
  );

  getIt.registerLazySingleton<CryptoFavoritesUseCase>(
    () => CryptoFavoritesUseCase(getIt<CryptoFavoritesRepository>()),
  );

  getIt.registerFactory<CryptoFavoritesBloc>(
    () => CryptoFavoritesBloc(getIt<CryptoFavoritesUseCase>()),
  );
}
