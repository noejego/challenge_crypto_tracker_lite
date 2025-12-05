import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_market_response_dto.g.dart';

@immutable
@JsonSerializable()
class CryptoMarketResponseDto {
  final String id;
  final String symbol;
  final String name;
  final String image;

  @JsonKey(name: 'current_price')
  final double? currentPrice;

  @JsonKey(name: 'market_cap')
  final int? marketCap;

  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;

  @JsonKey(name: 'fully_diluted_valuation')
  final int? fullyDilutedValuation;

  @JsonKey(name: 'total_volume')
  final int? totalVolume;

  @JsonKey(name: 'high_24h')
  final double? high24h;

  @JsonKey(name: 'low_24h')
  final double? low24h;

  @JsonKey(name: 'price_change_24h')
  final double? priceChange24h;

  @JsonKey(name: 'price_change_percentage_24h')
  final double? priceChangePercentage24h;

  @JsonKey(name: 'market_cap_change_24h')
  final int? marketCapChange24h;

  @JsonKey(name: 'market_cap_change_percentage_24h')
  final double? marketCapChangePercentage24h;

  @JsonKey(name: 'circulating_supply')
  final double? circulatingSupply;

  @JsonKey(name: 'total_supply')
  final double? totalSupply;

  @JsonKey(name: 'max_supply')
  final double? maxSupply;

  final double? ath;

  @JsonKey(name: 'ath_change_percentage')
  final double? athChangePercentage;

  @JsonKey(name: 'ath_date')
  final String? athDate;

  final double? atl;

  @JsonKey(name: 'atl_change_percentage')
  final double? atlChangePercentage;

  @JsonKey(name: 'atl_date')
  final String? atlDate;

  final dynamic roi;

  @JsonKey(name: 'last_updated')
  final String? lastUpdated;

  const CryptoMarketResponseDto({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.lastUpdated,
    this.fullyDilutedValuation,
    this.totalSupply,
    this.maxSupply,
    this.roi,
  });

  factory CryptoMarketResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CryptoMarketResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoMarketResponseDtoToJson(this);
}
