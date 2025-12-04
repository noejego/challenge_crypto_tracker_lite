import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoDetailsBloc extends Bloc<CryptoDetailsEvent, CryptoDetailsState> {
  final CryptosMarketUseCase cryptoDetailsUseCase;
  static final Map<String, CacheData<CryptoDetailsResponseEntity>> _cache =
      <String, CacheData<CryptoDetailsResponseEntity>>{};

  CryptoDetailsBloc(this.cryptoDetailsUseCase)
    : super(const CryptoDetailsState.initial()) {
    on<CryptoDetailsEvent>((
      CryptoDetailsEvent event,
      Emitter<CryptoDetailsState> emit,
    ) async {
      await event.maybeWhen(
        getCryptoDetails: (String cryptoId) => _load(cryptoId, emit),
        orElse: () {},
      );
    });
  }

  Future<void> _load(String cryptoId, Emitter<CryptoDetailsState> emit) async {
    emit(const CryptoDetailsState.loading());

    final CacheData<CryptoDetailsResponseEntity>? cacheEntry = _cache[cryptoId];

    if (cacheEntry != null) {
      final Duration age = DateTime.now().difference(cacheEntry.timestamp);

      if (age < CacheTtl.cacheTTL) {
        emit(CryptoDetailsState.loaded(cacheEntry.data));
        return;
      }
    }

    final BaseResponse<CryptoDetailsResponseEntity> result =
        await cryptoDetailsUseCase.getCryptoDetails(cryptoId);

    if (result.isSuccess) {
      _cache[cryptoId] = CacheData<CryptoDetailsResponseEntity>(
        result.data!,
        DateTime.now(),
      );
      emit(CryptoDetailsState.loaded(result.data!));
    } else {
      emit(CryptoDetailsState.error(result.error!.message));
    }
  }
}
