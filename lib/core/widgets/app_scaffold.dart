import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final bool showMenuIcon;
  final bool showFavoriteIcon;
  final bool isFavorite;
  final VoidCallback? onMenuPressed;

  const AppScaffold({
    required this.title,
    required this.body,
    this.showMenuIcon = false,
    this.showFavoriteIcon = false,
    this.isFavorite = false,
    this.onMenuPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: showMenuIcon ? const CustomSideMenu() : null,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.onSurface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: title,
        leading: showMenuIcon
            ? Builder(
                builder: (BuildContext ctx) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(ctx).openDrawer(),
                ),
              )
            : null,
        actions: showFavoriteIcon
            ? <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    color: isFavorite ? AppColors.primary : AppColors.outline,
                    size: 30,
                  ),
                ),
              ]
            : null,
      ),
      body: body,
    );
  }
}
