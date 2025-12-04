import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoRowWidget extends StatelessWidget {
  final CryptoMarketResponseEntity crypto;
  final VoidCallback? onTap;

  const CryptoRowWidget({required this.crypto, super.key, this.onTap});

  Color getFavoriteColor(bool isFavorite) {
    return isFavorite ? AppColors.primary : AppColors.onSurface;
  }

  @override
  Widget build(BuildContext context) {
    final double priceChange = crypto.priceChangePercentage24h;
    final Color priceChangeColor = priceChange >= 0
        ? AppColors.success
        : AppColors.error;

    return BlocBuilder<CryptoFavoritesBloc, CryptoFavoritesState>(
      builder: (BuildContext context, CryptoFavoritesState state) {
        final bool isFavorite = state.maybeWhen(
          loaded: (List<String> favorites) => favorites.contains(crypto.id),
          orElse: () => false,
        );

        return ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(crypto.image),
            radius: 20,
            backgroundColor: AppColors.surfaceVariant,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isFavorite ? AppColors.primary : Colors.transparent,
                  width: 3,
                ),
              ),
            ),
          ),
          title: Text(
            crypto.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: getFavoriteColor(isFavorite),
            ),
          ),
          subtitle: Text(
            crypto.symbol.toUpperCase(),
            style: TextStyle(color: getFavoriteColor(isFavorite)),
          ),
          trailing: SizedBox(
            width: 140,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '\$${crypto.currentPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getFavoriteColor(isFavorite),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${priceChange.toStringAsFixed(2)}%',
                      style: TextStyle(
                        color: priceChangeColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    color: isFavorite ? AppColors.primary : AppColors.outline,
                    size: 24,
                  ),
                  onPressed: () {
                    if (isFavorite) {
                      context.read<CryptoFavoritesBloc>().add(
                        CryptoFavoritesEvent.removeFavorite(crypto.id),
                      );
                    } else {
                      context.read<CryptoFavoritesBloc>().add(
                        CryptoFavoritesEvent.addFavorite(crypto.id),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
