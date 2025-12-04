import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CryptoMarketScreen extends StatefulWidget {
  const CryptoMarketScreen({super.key});

  @override
  State<CryptoMarketScreen> createState() => _CryptoMarketScreenState();
}

class _CryptoMarketScreenState extends State<CryptoMarketScreen>
    with WidgetsBindingObserver {
  late CryptoMarketBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<CryptoMarketBloc>();
    WidgetsBinding.instance.addObserver(this as WidgetsBindingObserver);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this as WidgetsBindingObserver);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      bloc.add(const CryptoMarketEvent.getCryptosMarket());
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoMarketBloc, CryptoMarketState>(
      builder: (BuildContext context, CryptoMarketState state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (List<CryptoMarketResponseEntity> cryptos) {
            return ListView.separated(
              itemCount: cryptos.length,
              separatorBuilder: (_, _) =>
                  Divider(color: Colors.grey.shade900, height: 1),
              itemBuilder: (BuildContext context, int index) {
                final CryptoMarketResponseEntity crypto = cryptos[index];

                return CryptoRowWidget(
                  crypto: crypto,
                  onTap: () {
                    context.push('/crypto_details/${crypto.id}');
                  },
                );
              },
            );
          },
          error: (String msg) => ErrorScreen(
            onRetry: () {
              context.read<CryptoMarketBloc>().add(
                const CryptoMarketEvent.getCryptosMarket(),
              );
            },
          ),
        );
      },
    );
  }
}
