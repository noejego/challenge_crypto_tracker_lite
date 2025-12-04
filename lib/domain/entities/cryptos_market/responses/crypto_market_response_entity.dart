import 'package:challenge_crypto_tracker_lite/data/data.dart';

class CryptoMarketResponseEntity extends CryptoMarketResponseDto {
  final bool isFavorite;

  const CryptoMarketResponseEntity({
    required super.id,
    required super.symbol,
    required super.name,
    required super.image,
    required super.currentPrice,
    required super.marketCap,
    required super.marketCapRank,
    required super.totalVolume,
    required super.high24h,
    required super.low24h,
    required super.priceChangePercentage24h,
    required super.marketCapChange24h,
    required super.marketCapChangePercentage24h,
    required super.circulatingSupply,
    required super.ath,
    required super.athChangePercentage,
    required super.athDate,
    required super.atl,
    required super.atlChangePercentage,
    required super.atlDate,
    required super.lastUpdated,
    super.fullyDilutedValuation,
    super.priceChange24h,
    super.totalSupply,
    super.maxSupply,
    super.roi,
    this.isFavorite = false,
  });

  CryptoMarketResponseDto toDataModel() {
    return CryptoMarketResponseDto(
      id: id,
      symbol: symbol,
      name: name,
      image: image,
      currentPrice: currentPrice,
      marketCap: marketCap,
      marketCapRank: marketCapRank,
      fullyDilutedValuation: fullyDilutedValuation,
      totalVolume: totalVolume,
      high24h: high24h,
      low24h: low24h,
      priceChange24h: priceChange24h,
      priceChangePercentage24h: priceChangePercentage24h,
      marketCapChange24h: marketCapChange24h,
      marketCapChangePercentage24h: marketCapChangePercentage24h,
      circulatingSupply: circulatingSupply,
      totalSupply: totalSupply,
      maxSupply: maxSupply,
      ath: ath,
      athChangePercentage: athChangePercentage,
      athDate: athDate,
      atl: atl,
      atlChangePercentage: atlChangePercentage,
      atlDate: atlDate,
      lastUpdated: lastUpdated,
      roi: roi,
    );
  }

  factory CryptoMarketResponseEntity.fromDataModel(
    CryptoMarketResponseDto dataModel, {
    bool isFavorite = false,
  }) {
    return CryptoMarketResponseEntity(
      id: dataModel.id,
      symbol: dataModel.symbol,
      name: dataModel.name,
      image: dataModel.image,
      currentPrice: dataModel.currentPrice,
      marketCap: dataModel.marketCap,
      marketCapRank: dataModel.marketCapRank,
      fullyDilutedValuation: dataModel.fullyDilutedValuation,
      totalVolume: dataModel.totalVolume,
      high24h: dataModel.high24h,
      low24h: dataModel.low24h,
      priceChange24h: dataModel.priceChange24h,
      priceChangePercentage24h: dataModel.priceChangePercentage24h,
      marketCapChange24h: dataModel.marketCapChange24h,
      marketCapChangePercentage24h: dataModel.marketCapChangePercentage24h,
      circulatingSupply: dataModel.circulatingSupply,
      totalSupply: dataModel.totalSupply,
      maxSupply: dataModel.maxSupply,
      ath: dataModel.ath,
      athChangePercentage: dataModel.athChangePercentage,
      athDate: dataModel.athDate,
      atl: dataModel.atl,
      atlChangePercentage: dataModel.atlChangePercentage,
      atlDate: dataModel.atlDate,
      lastUpdated: dataModel.lastUpdated,
      roi: dataModel.roi,
      isFavorite: isFavorite,
    );
  }
}
