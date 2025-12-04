import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_market_event.freezed.dart';

@freezed
class CryptoMarketEvent with _$CryptoMarketEvent {
  const factory CryptoMarketEvent.getCryptosMarket() = _LoadCryptos;
}
