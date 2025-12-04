import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_market_chart_response_dto.g.dart';

@immutable
@JsonSerializable()
class CryptoMarketChartResponseDto {
  @TimeValueListConverter()
  final List<TimeValue> prices;

  @JsonKey(name: 'market_caps')
  @TimeValueListConverter()
  final List<TimeValue> marketCaps;

  @JsonKey(name: 'total_volumes')
  @TimeValueListConverter()
  final List<TimeValue> totalVolumes;

  const CryptoMarketChartResponseDto({
    required this.prices,
    required this.marketCaps,
    required this.totalVolumes,
  });

  factory CryptoMarketChartResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CryptoMarketChartResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoMarketChartResponseDtoToJson(this);
}

@immutable
class TimeValue {
  final int timestampMs;
  final double value;

  const TimeValue({required this.timestampMs, required this.value});

  DateTime get dateTime =>
      DateTime.fromMillisecondsSinceEpoch(timestampMs, isUtc: true);

  factory TimeValue.fromJson(List<dynamic> pair) {
    if (pair.length != 2) {
      throw ArgumentError(
        'Se esperaba una lista de longitud 2 para TimeValue, recibido: ${pair.length}',
      );
    }
    final dynamic ts = pair[0];
    final dynamic val = pair[1];

    return TimeValue(
      timestampMs: ts is int ? ts : (ts as num).toInt(),
      value: val is double ? val : (val as num).toDouble(),
    );
  }

  List<dynamic> toJson() => <dynamic>[timestampMs, value];
}

class TimeValueListConverter
    implements JsonConverter<List<TimeValue>, List<dynamic>> {
  const TimeValueListConverter();

  @override
  List<TimeValue> fromJson(List<dynamic> json) {
    return json
        .map((dynamic e) => TimeValue.fromJson(e as List<dynamic>))
        .toList(growable: false);
  }

  @override
  List<dynamic> toJson(List<TimeValue> object) {
    return object.map((dynamic e) => e.toJson()).toList(growable: false);
  }
}
