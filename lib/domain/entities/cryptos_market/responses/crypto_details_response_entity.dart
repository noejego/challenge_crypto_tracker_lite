import 'package:challenge_crypto_tracker_lite/data/data.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';

class CryptoDetailsResponseEntity extends CryptoDetailsResponseDto {
  @override
  final DescriptionEntity description;

  @override
  final MarketDataEntity marketData;

  const CryptoDetailsResponseEntity({
    required super.id,
    required super.symbol,
    required super.name,
    required this.description,
    required super.webSlug,
    required this.marketData,
    super.assetPlatformId,
  }) : super(description: description, marketData: marketData);

  CryptoDetailsResponseDto toDataModel() {
    return CryptoDetailsResponseDto(
      id: super.id,
      symbol: super.symbol,
      name: super.name,
      description: description.toDataModel(),
      webSlug: super.webSlug,
      marketData: marketData.toDataModel(),
      assetPlatformId: super.assetPlatformId,
    );
  }

  factory CryptoDetailsResponseEntity.fromDataModel(
    CryptoDetailsResponseDto dataModel,
  ) {
    return CryptoDetailsResponseEntity(
      id: dataModel.id,
      symbol: dataModel.symbol,
      name: dataModel.name,
      description: DescriptionEntity.fromDataModel(dataModel.description),
      webSlug: dataModel.webSlug,
      assetPlatformId: dataModel.assetPlatformId,
      marketData: MarketDataEntity.fromDataModel(dataModel.marketData),
    );
  }
}

class DescriptionEntity extends Description {
  const DescriptionEntity({required super.en, super.de});

  Description toDataModel() {
    return Description(en: super.en, de: super.de);
  }

  factory DescriptionEntity.fromDataModel(Description dataModel) {
    return DescriptionEntity(en: dataModel.en, de: dataModel.de);
  }
}
