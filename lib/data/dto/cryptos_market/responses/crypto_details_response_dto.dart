import 'package:challenge_crypto_tracker_lite/data/data.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_details_response_dto.g.dart';

@immutable
@JsonSerializable()
class CryptoDetailsResponseDto {
  final String id;
  final String symbol;
  final String name;
  final Description description;

  @JsonKey(name: 'web_slug')
  final String webSlug;

  @JsonKey(name: 'asset_platform_id')
  final String? assetPlatformId;

  @JsonKey(name: 'market_data')
  final MarketData marketData;

  final ImageCrypto image;

  const CryptoDetailsResponseDto({
    required this.id,
    required this.symbol,
    required this.name,
    required this.description,
    required this.webSlug,
    required this.marketData,
    required this.image,
    this.assetPlatformId,
  });

  factory CryptoDetailsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CryptoDetailsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoDetailsResponseDtoToJson(this);
}

@immutable
@JsonSerializable()
class Description {
  final String en;
  final String? de;
  const Description({required this.en, this.de});

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}

@immutable
@JsonSerializable()
class ImageCrypto {
  final String thumb;
  final String small;
  final String large;
  const ImageCrypto({
    required this.large,
    required this.small,
    required this.thumb,
  });

  factory ImageCrypto.fromJson(Map<String, dynamic> json) =>
      _$ImageCryptoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageCryptoToJson(this);
}
