import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorScreen({required this.onRetry, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.error, width: 4),
                ),
                child: const Icon(
                  Icons.error_outline,
                  color: AppColors.error,
                  size: 48,
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                "Hubo un problema 😢",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurface,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "La API de CoinGecko tiene límites de velocidad.\n"
                "Por favor, espera unos momentos y presiona \"Reintentar\".",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color: AppColors.onSurfaceVariant,
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text("Reintentar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryContainer,
                  foregroundColor: AppColors.onSurface,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 28,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
