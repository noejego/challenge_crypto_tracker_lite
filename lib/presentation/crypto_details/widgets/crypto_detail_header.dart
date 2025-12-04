import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:flutter/material.dart';

class CryptoDetailHeader extends StatelessWidget {
  final String name;
  final String symbol;
  final String image;

  const CryptoDetailHeader({
    required this.name,
    required this.symbol,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(image),
          backgroundColor: AppColors.surfaceVariant,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Cryptocurrency name
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),

            Text(
              symbol.toUpperCase(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
