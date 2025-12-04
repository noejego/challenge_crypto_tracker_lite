import 'package:challenge_crypto_tracker_lite/data/data.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';

class CryptoDetailsResponseEntity extends CryptoDetailsResponseDto {
  @override
  final DescriptionEntity description;

  @override
  final MarketDataEntity marketData;

  @override
  final ImageCryptoEntity image;

  const CryptoDetailsResponseEntity({
    required super.id,
    required super.symbol,
    required super.name,
    required this.description,
    required super.webSlug,
    required this.marketData,
    required this.image,
    super.assetPlatformId,
  }) : super(description: description, marketData: marketData, image: image);

  CryptoDetailsResponseDto toDataModel() {
    return CryptoDetailsResponseDto(
      id: super.id,
      symbol: super.symbol,
      name: super.name,
      description: description.toDataModel(),
      webSlug: super.webSlug,
      marketData: marketData.toDataModel(),
      assetPlatformId: super.assetPlatformId,
      image: image.toDataModel(),
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
      image: ImageCryptoEntity.fromDataModel(dataModel.image),
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

class ImageCryptoEntity extends ImageCrypto {
  const ImageCryptoEntity({
    required super.large,
    required super.small,
    required super.thumb,
  });

  ImageCrypto toDataModel() {
    return ImageCrypto(
      large: super.large,
      small: super.small,
      thumb: super.thumb,
    );
  }

  factory ImageCryptoEntity.fromDataModel(ImageCrypto dataModel) {
    return ImageCryptoEntity(
      large: dataModel.large,
      small: dataModel.small,
      thumb: dataModel.thumb,
    );
  }
}
