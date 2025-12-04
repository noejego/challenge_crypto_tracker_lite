import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoFavoritesBloc
    extends Bloc<CryptoFavoritesEvent, CryptoFavoritesState> {
  final CryptoFavoritesUseCase favoritesUseCase;

  CryptoFavoritesBloc(this.favoritesUseCase)
    : super(const CryptoFavoritesState.initial()) {
    on<CryptoFavoritesEvent>((
      CryptoFavoritesEvent event,
      Emitter<CryptoFavoritesState> emit,
    ) async {
      await event.when(
        loadFavorites: () async {
          emit(const CryptoFavoritesState.loading());
          try {
            final List<String> favorites = await favoritesUseCase
                .getFavorites();
            emit(CryptoFavoritesState.loaded(favorites));
          } on Exception catch (_) {
            emit(const CryptoFavoritesState.error());
          }
        },
        addFavorite: (String id) async {
          try {
            await favoritesUseCase.addFavorite(id);
            final List<String> favorites = await favoritesUseCase
                .getFavorites();
            emit(CryptoFavoritesState.loaded(favorites));
          } on Exception catch (_) {
            emit(const CryptoFavoritesState.error());
          }
        },
        removeFavorite: (String id) async {
          try {
            await favoritesUseCase.removeFavorite(id);
            final List<String> favorites = await favoritesUseCase
                .getFavorites();
            emit(CryptoFavoritesState.loaded(favorites));
          } on Exception catch (_) {
            emit(const CryptoFavoritesState.error());
          }
        },
      );
    });
  }
}
