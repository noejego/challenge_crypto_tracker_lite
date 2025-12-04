import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_favorites_event.freezed.dart';

@freezed
class CryptoFavoritesEvent with _$CryptoFavoritesEvent {
  const factory CryptoFavoritesEvent.loadFavorites() = _LoadFavorites;
  const factory CryptoFavoritesEvent.addFavorite(String id) = _AddFavorite;
  const factory CryptoFavoritesEvent.removeFavorite(String id) =
      _RemoveFavorite;
}
