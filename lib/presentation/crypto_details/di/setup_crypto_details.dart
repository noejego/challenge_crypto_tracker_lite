import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';

void setupCryptoDetails() {
  getIt.registerFactory<CryptoDetailsBloc>(
    () => CryptoDetailsBloc(getIt<CryptosMarketUseCase>()),
  );
}
