import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_market_state.freezed.dart';

@freezed
class CryptoMarketState with _$CryptoMarketState {
  const factory CryptoMarketState.initial() = _Initial;
  const factory CryptoMarketState.loading() = _Loading;
  const factory CryptoMarketState.loaded(
    List<CryptoMarketResponseEntity> cryptos,
  ) = _Loaded;
  const factory CryptoMarketState.loadedFavorites(
    List<CryptoMarketResponseEntity> cryptos,
  ) = _LoadedFavorites;
  const factory CryptoMarketState.error(String message) = _Error;
}
