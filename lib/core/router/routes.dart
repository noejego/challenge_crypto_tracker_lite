import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nested/nested.dart';

final GoRouter routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider<CryptoMarketBloc>(
          create: (_) =>
              getIt<CryptoMarketBloc>()
                ..add(const CryptoMarketEvent.getCryptosMarket()),
          child: AppScaffold(
            title: 'CryptoTracker Lite',
            showMenuIcon: true,
            onMenuPressed: () {},
            body: const CryptoMarketScreen(),
          ),
        );
      },
    ),
    GoRoute(
      path: '/crypto_details/:id',
      builder: (BuildContext context, GoRouterState state) {
        final String cryptoId = state.pathParameters['id']!;
        final CryptoDetailsBloc detailsBloc = getIt<CryptoDetailsBloc>()
          ..add(CryptoDetailsEvent.getCryptoDetails(cryptoId: cryptoId));

        final CryptoMarketChartBloc chartBloc = getIt<CryptoMarketChartBloc>()
          ..add(
            CryptoMarketChartEvent.getCryptoMarketChart(cryptoId: cryptoId),
          );
        final bool isFavorite = context
            .read<CryptoFavoritesBloc>()
            .state
            .maybeWhen(
              loaded: (List<String> favorites) => favorites.contains(cryptoId),
              orElse: () => false,
            );

        return MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider<CryptoDetailsBloc>.value(value: detailsBloc),
            BlocProvider<CryptoMarketChartBloc>.value(value: chartBloc),
          ],
          child: AppScaffold(
            title: 'Detalle',
            showFavoriteIcon: true,
            isFavorite: isFavorite,
            body: CryptoDetailsScreen(cryptoId: cryptoId),
          ),
        );
      },
    ),
  ],
);
