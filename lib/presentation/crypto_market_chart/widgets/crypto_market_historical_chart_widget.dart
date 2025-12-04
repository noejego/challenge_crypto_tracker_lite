import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoMarketHistoricalChartWidget extends StatelessWidget {
  final double priceChangePercentage7d;
  const CryptoMarketHistoricalChartWidget({
    required this.priceChangePercentage7d,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Precio histórico (7 días)',
                  style: TextStyle(fontSize: 16, color: AppColors.onSurface),
                ),
                Chip(
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        priceChangePercentage7d >= 0
                            ? Icons.trending_up
                            : Icons.trending_down,
                        color: priceChangePercentage7d >= 0
                            ? AppColors.success
                            : AppColors.error,
                        size: 10,
                      ),
                      const SizedBox(width: 4),

                      Text(
                        '${priceChangePercentage7d.toStringAsFixed(2)}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: priceChangePercentage7d >= 0
                              ? AppColors.success
                              : AppColors.error,
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: priceChangePercentage7d >= 0
                      ? AppColors.success.withValues(alpha: 0.1)
                      : AppColors.error.withValues(alpha: 0.1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 280,
            child: BlocBuilder<CryptoMarketChartBloc, CryptoMarketChartState>(
              builder: (BuildContext context, CryptoMarketChartState state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (CryptoMarketChartResponseEntity crypto) =>
                      CryptoLineChart(prices: crypto.pricesEntity),
                  error: (String message) =>
                      Center(child: Text('Error: $message')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
