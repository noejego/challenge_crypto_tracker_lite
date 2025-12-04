import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider<CryptoMarketBloc>(
          create: (_) =>
              getIt<CryptoMarketBloc>()
                ..add(const CryptoMarketEvent.getCryptosMarket()),
          child: const AppScaffold(
            title: 'CryptoTracker Lite',
            body: CryptoMarketScreen(),
          ),
        );
      },
    ),
    GoRoute(
      path: '/crypto_details/:id',
      builder: (BuildContext context, GoRouterState state) {
        final String cryptoId = state.pathParameters['id']!;

        return BlocProvider<CryptoDetailsBloc>(
          create: (_) =>
              getIt<CryptoDetailsBloc>()
                ..add(CryptoDetailsEvent.getCryptoDetails(cryptoId: cryptoId)),
          child: AppScaffold(
            title: 'Detalle',
            body: CryptoDetailsScreen(id: cryptoId),
          ),
        );
      },
    ),
  ],
);
