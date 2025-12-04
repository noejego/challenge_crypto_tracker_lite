import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_favorites_state.freezed.dart';

@freezed
class CryptoFavoritesState with _$CryptoFavoritesState {
  const factory CryptoFavoritesState.initial() = _Initial;
  const factory CryptoFavoritesState.loading() = _Loading;
  const factory CryptoFavoritesState.loaded(List<String> favorites) = _Loaded;
  const factory CryptoFavoritesState.error() = _Error;
}
