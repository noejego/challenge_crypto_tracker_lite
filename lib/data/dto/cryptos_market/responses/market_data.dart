import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market_data.g.dart';

@immutable
@JsonSerializable()
class MarketData {
  @JsonKey(name: 'current_price')
  final CurrentPrice currentPrice;

  @JsonKey(name: 'high_24h')
  final Hight24H hight24h;

  @JsonKey(name: 'low_24h')
  final Low24H low24h;

  @JsonKey(name: 'market_cap')
  final MarketCap marketCap;

  @JsonKey(name: 'total_volume')
  final TotalVolume totalVolume;

  const MarketData({
    required this.currentPrice,
    required this.hight24h,
    required this.low24h,
    required this.marketCap,
    required this.totalVolume,
  });

  factory MarketData.fromJson(Map<String, dynamic> json) =>
      _$MarketDataFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDataToJson(this);
}

@immutable
@JsonSerializable()
class CurrentPrice {
  final double usd;

  const CurrentPrice({required this.usd});

  factory CurrentPrice.fromJson(Map<String, dynamic> json) =>
      _$CurrentPriceFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentPriceToJson(this);
}

@immutable
@JsonSerializable()
class Hight24H {
  final double usd;

  const Hight24H({required this.usd});

  factory Hight24H.fromJson(Map<String, dynamic> json) =>
      _$Hight24HFromJson(json);

  Map<String, dynamic> toJson() => _$Hight24HToJson(this);
}

@immutable
@JsonSerializable()
class Low24H {
  final double usd;

  const Low24H({required this.usd});
  factory Low24H.fromJson(Map<String, dynamic> json) => _$Low24HFromJson(json);

  Map<String, dynamic> toJson() => _$Low24HToJson(this);
}

@immutable
@JsonSerializable()
class MarketCap {
  final double usd;

  const MarketCap({required this.usd});
  factory MarketCap.fromJson(Map<String, dynamic> json) =>
      _$MarketCapFromJson(json);

  Map<String, dynamic> toJson() => _$MarketCapToJson(this);
}

@immutable
@JsonSerializable()
class TotalVolume {
  final double usd;

  const TotalVolume({required this.usd});
  factory TotalVolume.fromJson(Map<String, dynamic> json) =>
      _$TotalVolumeFromJson(json);

  Map<String, dynamic> toJson() => _$TotalVolumeToJson(this);
}
