import 'package:challenge_crypto_tracker_lite/data/data.dart';

class CryptoFavoritesUseCase {
  final CryptoFavoritesRepository repository;

  CryptoFavoritesUseCase(this.repository);

  Future<List<String>> getFavorites() => repository.getFavorites();
  Future<void> addFavorite(String id) => repository.addFavorite(id);
  Future<void> removeFavorite(String id) => repository.removeFavorite(id);
  Future<bool> isFavorite(String id) => repository.isFavorite(id);
}
