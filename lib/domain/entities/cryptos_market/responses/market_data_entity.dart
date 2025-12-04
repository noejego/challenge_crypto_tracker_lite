import 'package:challenge_crypto_tracker_lite/data/data.dart';

class MarketDataEntity extends MarketData {
  @override
  final CurrentPriceEntity currentPrice;
  @override
  final Hight24HEntity hight24h;
  @override
  final Low24HEntity low24h;
  @override
  final MarketCapEntity marketCap;
  @override
  final TotalVolumeEntity totalVolume;

  const MarketDataEntity({
    required this.currentPrice,
    required this.hight24h,
    required this.low24h,
    required this.marketCap,
    required this.totalVolume,
    required super.priceChangePercentage24h,
    required super.priceChangePercentage7d,
  }) : super(
         currentPrice: currentPrice,
         hight24h: hight24h,
         low24h: low24h,
         marketCap: marketCap,
         totalVolume: totalVolume,
       );

  MarketData toDataModel() {
    return MarketData(
      currentPrice: currentPrice.toDataModel(),
      hight24h: hight24h.toDataModel(),
      low24h: low24h.toDataModel(),
      marketCap: marketCap.toDataModel(),
      totalVolume: totalVolume.toDataModel(),
      priceChangePercentage24h: priceChangePercentage24h,
      priceChangePercentage7d: priceChangePercentage7d,
    );
  }

  factory MarketDataEntity.fromDataModel(MarketData dataModel) {
    return MarketDataEntity(
      currentPrice: CurrentPriceEntity.fromDataModel(dataModel.currentPrice),
      hight24h: Hight24HEntity.fromDataModel(dataModel.hight24h),
      low24h: Low24HEntity.fromDataModel(dataModel.low24h),
      marketCap: MarketCapEntity.fromDataModel(dataModel.marketCap),
      totalVolume: TotalVolumeEntity.fromDataModel(dataModel.totalVolume),
      priceChangePercentage24h: dataModel.priceChangePercentage24h,
      priceChangePercentage7d: dataModel.priceChangePercentage7d,
    );
  }
}

class CurrentPriceEntity extends CurrentPrice {
  @override
  final double usd;

  const CurrentPriceEntity({required this.usd}) : super(usd: usd);

  CurrentPrice toDataModel() {
    return CurrentPrice(usd: usd);
  }

  factory CurrentPriceEntity.fromDataModel(CurrentPrice dataModel) {
    return CurrentPriceEntity(usd: dataModel.usd);
  }
}

class Hight24HEntity extends Hight24H {
  @override
  final double usd;

  const Hight24HEntity({required this.usd}) : super(usd: usd);

  Hight24H toDataModel() {
    return Hight24H(usd: usd);
  }

  factory Hight24HEntity.fromDataModel(Hight24H dataModel) {
    return Hight24HEntity(usd: dataModel.usd);
  }
}

class Low24HEntity extends Low24H {
  @override
  final double usd;

  const Low24HEntity({required this.usd}) : super(usd: usd);

  Low24H toDataModel() {
    return Low24H(usd: usd);
  }

  factory Low24HEntity.fromDataModel(Low24H dataModel) {
    return Low24HEntity(usd: dataModel.usd);
  }
}

class MarketCapEntity extends MarketCap {
  @override
  final double usd;

  const MarketCapEntity({required this.usd}) : super(usd: usd);

  MarketCap toDataModel() {
    return MarketCap(usd: usd);
  }

  factory MarketCapEntity.fromDataModel(MarketCap dataModel) {
    return MarketCapEntity(usd: dataModel.usd);
  }
}

class TotalVolumeEntity extends TotalVolume {
  @override
  final double usd;

  const TotalVolumeEntity({required this.usd}) : super(usd: usd);

  TotalVolume toDataModel() {
    return TotalVolume(usd: usd);
  }

  factory TotalVolumeEntity.fromDataModel(TotalVolume dataModel) {
    return TotalVolumeEntity(usd: dataModel.usd);
  }
}
