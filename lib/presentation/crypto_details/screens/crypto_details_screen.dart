import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoDetailsScreen extends StatelessWidget {
  final String cryptoId;
  const CryptoDetailsScreen({required this.cryptoId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CryptoDetailsBloc>.value(
      value: context.read<CryptoDetailsBloc>(),
      child: BlocBuilder<CryptoDetailsBloc, CryptoDetailsState>(
        builder: (BuildContext context, CryptoDetailsState state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (CryptoDetailsResponseEntity crypto) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CryptoDetailInfo(crypto: crypto),
                    CryptoMarketHistoricalChartWidget(
                      priceChangePercentage7d:
                          crypto.marketData.priceChangePercentage7d,
                    ),
                    CryptoDetailDescription(description: crypto.description.en),
                  ],
                ),
              ),
            ),
            error: (String message) => ErrorScreen(
              onRetry: () {
                context.read<CryptoDetailsBloc>().add(
                  CryptoDetailsEvent.getCryptoDetails(cryptoId: cryptoId),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
