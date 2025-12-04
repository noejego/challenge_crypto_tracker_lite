import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:flutter/material.dart';

class CryptoDetailDescription extends StatelessWidget {
  final String description;

  const CryptoDetailDescription({required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Acerca de',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.onSurfaceVariant,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
