import 'package:challenge_crypto_tracker_lite/core/utils/base_response.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoDetailsBloc extends Bloc<CryptoDetailsEvent, CryptoDetailsState> {
  final CryptosMarketUseCase cryptoDetailsUseCase;

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

    final BaseResponse<CryptoDetailsResponseEntity> result =
        await cryptoDetailsUseCase.getCryptoDetails(cryptoId);

    if (result.isSuccess) {
      emit(CryptoDetailsState.loaded(result.data!));
    } else {
      emit(CryptoDetailsState.error(result.error!.message));
    }
  }
}
