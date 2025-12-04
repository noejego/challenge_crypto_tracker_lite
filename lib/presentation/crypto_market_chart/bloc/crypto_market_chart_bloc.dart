import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoMarketChartBloc
    extends Bloc<CryptoMarketChartEvent, CryptoMarketChartState> {
  final CryptosMarketUseCase cryptoDetailsUseCase;
  static final Map<String, CacheData<CryptoMarketChartResponseEntity>> _cache =
      <String, CacheData<CryptoMarketChartResponseEntity>>{};

  CryptoMarketChartBloc(this.cryptoDetailsUseCase)
    : super(const CryptoMarketChartState.initial()) {
    on<CryptoMarketChartEvent>((
      CryptoMarketChartEvent event,
      Emitter<CryptoMarketChartState> emit,
    ) async {
      await event.maybeWhen(
        getCryptoMarketChart: (String cryptoId) => _load(cryptoId, emit),
        orElse: () {},
      );
    });
  }

  Future<void> _load(
    String cryptoId,
    Emitter<CryptoMarketChartState> emit,
  ) async {
    emit(const CryptoMarketChartState.loading());

    final CacheData<CryptoMarketChartResponseEntity>? cacheEntry =
        _cache[cryptoId];

    if (cacheEntry != null) {
      final Duration age = DateTime.now().difference(cacheEntry.timestamp);

      if (age < CacheTtl.cacheTTL) {
        emit(CryptoMarketChartState.loaded(cacheEntry.data));
        return;
      }
    }

    final BaseResponse<CryptoMarketChartResponseEntity> result =
        await cryptoDetailsUseCase.getCryptoMarketChart(cryptoId);

    if (result.isSuccess) {
      _cache[cryptoId] = CacheData<CryptoMarketChartResponseEntity>(
        result.data!,
        DateTime.now(),
      );
      emit(CryptoMarketChartState.loaded(result.data!));
    } else {
      emit(CryptoMarketChartState.error(result.error!.message));
    }
  }
}
