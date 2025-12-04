import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/data/data.dart';

class CryptosMarketRepository implements CryptosMarketInterface {
  final CryptosMarketDatasource cryptoRemoteDataSource;

  CryptosMarketRepository(this.cryptoRemoteDataSource);
  @override
  Future<BaseResponse<List<CryptoMarketResponseDto>>> getCryptosMarket() async {
    return await cryptoRemoteDataSource.getCryptosMarket();
  }

  @override
  Future<BaseResponse<CryptoDetailsResponseDto>> getCryptoDetails(
    String cryptoId,
  ) async {
    return await cryptoRemoteDataSource.getCryptoDetails(cryptoId);
  }
}
