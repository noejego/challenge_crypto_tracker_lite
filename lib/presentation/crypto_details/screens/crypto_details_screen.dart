import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart'; // importa tu bloc y estados
import 'package:challenge_crypto_tracker_lite/core/core.dart'; // si tienes getIt

class CryptoDetailsScreen extends StatelessWidget {
  final String id;
  const CryptoDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CryptoDetailsBloc>.value(
      value: context.read<CryptoDetailsBloc>(),
      child: BlocBuilder<CryptoDetailsBloc, CryptoDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (crypto) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre: ${crypto.name}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Símbolo: ${crypto.symbol}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'descripcion: \$${crypto.description.en}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            error: (message) => Center(child: Text('Error: $message')),
          );
        },
      ),
    );
  }
}
