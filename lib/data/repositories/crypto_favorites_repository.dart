import 'package:shared_preferences/shared_preferences.dart';

class CryptoFavoritesRepository {
  static const String _favoritesKey = 'favorite_cryptos';

  Future<void> saveFavorites(List<String> ids) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(_favoritesKey, ids);
  }

  Future<List<String>> getFavorites() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(_favoritesKey) ?? <String>[];
  }

  Future<void> addFavorite(String id) async {
    final List<String> current = await getFavorites();
    if (!current.contains(id)) {
      current.add(id);
      await saveFavorites(current);
    }
  }

  Future<void> removeFavorite(String id) async {
    final List<String> current = await getFavorites();
    if (current.contains(id)) {
      current.remove(id);
      await saveFavorites(current);
    }
  }

  Future<bool> isFavorite(String id) async {
    final List<String> current = await getFavorites();
    return current.contains(id);
  }
}
