import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/data/data.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';

abstract interface class CryptosMarketUseCaseInterface {
  Future<BaseResponse<List<CryptoMarketResponseEntity>>> getCryptosMarket();
  Future<BaseResponse<CryptoDetailsResponseEntity>> getCryptoDetails(
    String cryptoId,
  );
}

class CryptosMarketUseCase implements CryptosMarketUseCaseInterface {
  final CryptosMarketInterface cryptosMarketRepository;

  CryptosMarketUseCase(this.cryptosMarketRepository);

  @override
  Future<BaseResponse<List<CryptoMarketResponseEntity>>>
  getCryptosMarket() async {
    final BaseResponse<List<CryptoMarketResponseDto>> responseDto =
        await cryptosMarketRepository.getCryptosMarket();
    if (responseDto.isSuccess) {
      return BaseResponse<List<CryptoMarketResponseEntity>>.success(
        responseDto.data
            ?.map(CryptoMarketResponseEntity.fromDataModel)
            .toList(),
      );
    } else {
      return BaseResponse<List<CryptoMarketResponseEntity>>.failure(
        responseDto.error,
      );
    }
  }

  @override
  Future<BaseResponse<CryptoDetailsResponseEntity>> getCryptoDetails(
    String cryptoId,
  ) async {
    final BaseResponse<CryptoDetailsResponseDto> responseDto =
        await cryptosMarketRepository.getCryptoDetails(cryptoId);
    if (responseDto.isSuccess) {
      return BaseResponse<CryptoDetailsResponseEntity>.success(
        CryptoDetailsResponseEntity.fromDataModel(responseDto.data!),
      );
    } else {
      return BaseResponse<CryptoDetailsResponseEntity>.failure(
        responseDto.error,
      );
    }
  }
}
