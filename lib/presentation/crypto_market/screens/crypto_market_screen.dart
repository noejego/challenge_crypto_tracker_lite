import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CryptoMarketScreen extends StatelessWidget {
  const CryptoMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoMarketBloc, CryptoMarketState>(
      builder: (BuildContext context, CryptoMarketState state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (List<CryptoMarketResponseEntity> cryptos) {
            return ListView.builder(
              itemCount: cryptos.length,
              itemBuilder: (BuildContext context, int index) {
                final CryptoMarketResponseEntity crypto = cryptos[index];
                return ListTile(
                  leading: Image.network(crypto.image, width: 32, height: 32),
                  title: Text(crypto.name),
                  subtitle: Text('\$${crypto.currentPrice.toStringAsFixed(2)}'),
                  onTap: () {
                    context.push('/crypto_details/${crypto.id}');
                  },
                );
              },
            );
          },
          error: (String msg) => Center(child: Text('Error: $msg')),
        );
      },
    );
  }
}
