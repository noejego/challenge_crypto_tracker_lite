import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/data/data.dart';
import 'package:dio/dio.dart';

class CryptosMarketDatasource implements CryptosMarketInterface {
  final Dio dioClient;

  CryptosMarketDatasource(this.dioClient);
  @override
  Future<BaseResponse<List<CryptoMarketResponseDto>>> getCryptosMarket() {
    return safeApiCall(() async {
      final Response<dynamic> cryptosResponse = await dioClient.get(
        '/coins/markets',
        queryParameters: <String, dynamic>{'vs_currency': 'usd'},
      );
      final List<dynamic> data = cryptosResponse.data as List<dynamic>;
      return data
          .map((dynamic crypto) => CryptoMarketResponseDto.fromJson(crypto))
          .toList();
    });
  }

  @override
  Future<BaseResponse<CryptoDetailsResponseDto>> getCryptoDetails(
    String cryptoId,
  ) {
    return safeApiCall(() async {
      final Response<dynamic> cryptoResponse = await dioClient.get(
        '/coins/$cryptoId',
      );
      final dynamic data = cryptoResponse.data;
      return CryptoDetailsResponseDto.fromJson(data);
    });
  }

  @override
  Future<BaseResponse<CryptoMarketChartResponseDto>> getCryptoMarketChart(
    String cryptoId,
  ) {
    return safeApiCall(() async {
      final Response<dynamic> cryptoResponse = await dioClient.get(
        '/coins/$cryptoId/market_chart',
        queryParameters: <String, dynamic>{'vs_currency': 'usd', 'days': 7},
      );
      final dynamic data = cryptoResponse.data;
      return CryptoMarketChartResponseDto.fromJson(data);
    });
  }
}
