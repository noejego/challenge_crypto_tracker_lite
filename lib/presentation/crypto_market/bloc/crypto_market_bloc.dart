import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoMarketBloc extends Bloc<CryptoMarketEvent, CryptoMarketState> {
  final CryptosMarketUseCase cryptosMarketUseCase;
  static CacheData<List<CryptoMarketResponseEntity>>? _cache;

  CryptoMarketBloc(this.cryptosMarketUseCase)
    : super(const CryptoMarketState.initial()) {
    on<CryptoMarketEvent>((
      CryptoMarketEvent event,
      Emitter<CryptoMarketState> emit,
    ) async {
      await event.maybeWhen(
        getCryptosMarket: () => _load(emit),
        getCryptosMarketFavorites: (List<String> favoriteIds) =>
            _loadFavorites(emit, favoriteIds),
        orElse: () {},
      );
    });
  }

  Future<void> _load(Emitter<CryptoMarketState> emit) async {
    emit(const CryptoMarketState.loading());

    if (_cache != null) {
      final Duration age = DateTime.now().difference(_cache!.timestamp);

      if (age < CacheTtl.cacheTTL) {
        emit(CryptoMarketState.loaded(_cache!.data));
        return;
      }
    }

    final BaseResponse<List<CryptoMarketResponseEntity>> result =
        await cryptosMarketUseCase.getCryptosMarket();

    if (result.isSuccess) {
      _cache = CacheData<List<CryptoMarketResponseEntity>>(
        result.data!,
        DateTime.now(),
      );
      emit(CryptoMarketState.loaded(result.data!));
    } else {
      emit(CryptoMarketState.error(result.error!.message));
    }
  }

  Future<void> _loadFavorites(
    Emitter<CryptoMarketState> emit,
    List<String> favoriteIds,
  ) async {
    emit(const CryptoMarketState.loading());

    if (_cache != null) {
      final List<CryptoMarketResponseEntity> favorites = _cache!.data
          .where(
            (CryptoMarketResponseEntity crypto) =>
                favoriteIds.contains(crypto.id),
          )
          .toList();

      emit(CryptoMarketState.loadedFavorites(favorites));
      return;
    }

    await _load(emit);

    if (_cache != null) {
      final List<CryptoMarketResponseEntity> favorites = _cache!.data
          .where(
            (CryptoMarketResponseEntity crypto) =>
                favoriteIds.contains(crypto.id),
          )
          .toList();

      emit(CryptoMarketState.loadedFavorites(favorites));
    }
  }
}
