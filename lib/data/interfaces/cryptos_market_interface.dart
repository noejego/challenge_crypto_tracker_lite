import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/data/data.dart';

abstract interface class CryptosMarketInterface {
  Future<BaseResponse<List<CryptoMarketResponseDto>>> getCryptosMarket();
  Future<BaseResponse<CryptoDetailsResponseDto>> getCryptoDetails(
    String cryptoId,
  );
  Future<BaseResponse<CryptoMarketChartResponseDto>> getCryptoMarketChart(
    String cryptoId,
  );
}
