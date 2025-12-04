import 'package:challenge_crypto_tracker_lite/data/data.dart';

class CryptoMarketChartResponseEntity extends CryptoMarketChartResponseDto {
  @override
  final List<TimeValue> prices;

  @override
  final List<TimeValue> marketCaps;

  @override
  final List<TimeValue> totalVolumes;

  CryptoMarketChartResponseEntity({
    required List<TimeValueEntity> pricesEntity,
    required List<TimeValueEntity> marketCapsEntity,
    required List<TimeValueEntity> totalVolumesEntity,
  }) : prices = pricesEntity
           .map((TimeValueEntity e) => e as TimeValue)
           .toList(growable: false),
       marketCaps = marketCapsEntity
           .map((TimeValueEntity e) => e as TimeValue)
           .toList(growable: false),
       totalVolumes = totalVolumesEntity
           .map((TimeValueEntity e) => e as TimeValue)
           .toList(growable: false),
       super(
         prices: pricesEntity
             .map((TimeValueEntity e) => e as TimeValue)
             .toList(growable: false),
         marketCaps: marketCapsEntity
             .map((TimeValueEntity e) => e as TimeValue)
             .toList(growable: false),
         totalVolumes: totalVolumesEntity
             .map((TimeValueEntity e) => e as TimeValue)
             .toList(growable: false),
       );

  CryptoMarketChartResponseDto toDataModel() {
    return CryptoMarketChartResponseDto(
      prices: prices
          .map((TimeValue e) => e is TimeValueEntity ? e.toDataModel() : e)
          .toList(growable: false),
      marketCaps: marketCaps
          .map((TimeValue e) => e is TimeValueEntity ? e.toDataModel() : e)
          .toList(growable: false),
      totalVolumes: totalVolumes
          .map((TimeValue e) => e is TimeValueEntity ? e.toDataModel() : e)
          .toList(growable: false),
    );
  }

  factory CryptoMarketChartResponseEntity.fromDataModel(
    CryptoMarketChartResponseDto dataModel,
  ) {
    return CryptoMarketChartResponseEntity(
      pricesEntity: dataModel.prices
          .map(TimeValueEntity.fromDataModel)
          .toList(growable: false),
      marketCapsEntity: dataModel.marketCaps
          .map(TimeValueEntity.fromDataModel)
          .toList(growable: false),
      totalVolumesEntity: dataModel.totalVolumes
          .map(TimeValueEntity.fromDataModel)
          .toList(growable: false),
    );
  }

  List<TimeValueEntity> get pricesEntity => prices.cast<TimeValueEntity>();
  List<TimeValueEntity> get marketCapsEntity =>
      marketCaps.cast<TimeValueEntity>();
  List<TimeValueEntity> get totalVolumesEntity =>
      totalVolumes.cast<TimeValueEntity>();
}

class TimeValueEntity extends TimeValue {
  const TimeValueEntity({required super.timestampMs, required super.value});

  TimeValue toDataModel() {
    return TimeValue(timestampMs: super.timestampMs, value: super.value);
  }

  factory TimeValueEntity.fromDataModel(TimeValue dataModel) {
    return TimeValueEntity(
      timestampMs: dataModel.timestampMs,
      value: dataModel.value,
    );
  }

  DateTime get dateTimeUtc =>
      DateTime.fromMillisecondsSinceEpoch(super.timestampMs, isUtc: true);
}
