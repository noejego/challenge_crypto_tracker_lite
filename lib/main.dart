import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();

  runApp(const CryptoTrackerApp());
}

class CryptoTrackerApp extends StatelessWidget {
  const CryptoTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<CryptoFavoritesBloc>(
          create: (_) =>
              getIt<CryptoFavoritesBloc>()
                ..add(const CryptoFavoritesEvent.loadFavorites()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Crypto Tracker Lite',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        theme: AppTheme.darkTheme,
        routerConfig: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
