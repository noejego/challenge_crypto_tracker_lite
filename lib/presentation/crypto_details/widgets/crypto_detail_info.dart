import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter/material.dart';

class CryptoDetailInfo extends StatelessWidget {
  final CryptoDetailsResponseEntity crypto;

  const CryptoDetailInfo({required this.crypto, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: <Widget>[
        CryptoDetailHeader(
          name: crypto.name,
          symbol: crypto.symbol,
          image: crypto.image.large,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '\$${crypto.marketData.currentPrice.usd.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),
            Chip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    crypto.marketData.priceChangePercentage24h >= 0
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    color: crypto.marketData.priceChangePercentage24h >= 0
                        ? AppColors.success
                        : AppColors.error,
                    size: 12,
                  ),
                  const SizedBox(width: 4),

                  Text(
                    '${crypto.marketData.priceChangePercentage24h.toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 14,
                      color: crypto.marketData.priceChangePercentage24h >= 0
                          ? AppColors.success
                          : AppColors.error,
                    ),
                  ),
                ],
              ),
              backgroundColor: crypto.marketData.priceChangePercentage24h >= 0
                  ? AppColors.success.withValues(alpha: 0.1)
                  : AppColors.error.withValues(alpha: 0.1),
            ),
          ],
        ),

        GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 2.0,
          ),
          children: <Widget>[
            StatCard(
              icon: Icons.trending_up,
              label: 'Máximo 24h',
              value: simplifyFormatNumber(crypto.marketData.hight24h.usd),
              iconColor: AppColors.success,
            ),
            StatCard(
              icon: Icons.trending_down,
              label: 'Mínimo 24h',
              value: simplifyFormatNumber(crypto.marketData.low24h.usd),
              iconColor: AppColors.error,
            ),
            StatCard(
              icon: Icons.account_balance_wallet,
              label: 'Capitalización',
              value: simplifyFormatNumber(crypto.marketData.marketCap.usd),
              iconColor: AppColors.tertiary,
            ),
            StatCard(
              icon: Icons.swap_horiz,
              label: 'Volumen 24h',
              value: simplifyFormatNumber(crypto.marketData.totalVolume.usd),
              iconColor: AppColors.errorContainer,
            ),
          ],
        ),
      ],
    );
  }
}
