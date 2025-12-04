import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_market_chart_event.freezed.dart';

@freezed
abstract class CryptoMarketChartEvent with _$CryptoMarketChartEvent {
  const factory CryptoMarketChartEvent.getCryptoMarketChart({
    required String cryptoId,
  }) = _LoadCryptoMarketChart;
}
