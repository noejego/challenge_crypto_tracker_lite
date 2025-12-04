import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_market_chart_state.freezed.dart';

@freezed
class CryptoMarketChartState with _$CryptoMarketChartState {
  const factory CryptoMarketChartState.initial() = _Initial;
  const factory CryptoMarketChartState.loading() = _Loading;
  const factory CryptoMarketChartState.loaded(
    CryptoMarketChartResponseEntity cryptoMarketChart,
  ) = _Loaded;
  const factory CryptoMarketChartState.error(String message) = _Error;
}
