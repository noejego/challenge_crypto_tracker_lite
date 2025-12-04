import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_details_state.freezed.dart';

@freezed
class CryptoDetailsState with _$CryptoDetailsState {
  const factory CryptoDetailsState.initial() = _Initial;
  const factory CryptoDetailsState.loading() = _Loading;
  const factory CryptoDetailsState.loaded(
    CryptoDetailsResponseEntity cryptoDetails,
  ) = _Loaded;
  const factory CryptoDetailsState.error(String message) = _Error;
}
