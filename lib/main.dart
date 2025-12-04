import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();

  runApp(const CryptoTrackerApp());
}

class CryptoTrackerApp extends StatelessWidget {
  const CryptoTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Crypto Tracker Lite',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
